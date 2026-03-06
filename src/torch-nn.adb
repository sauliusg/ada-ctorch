with Ada.Text_Io; use Ada.Text_Io;
with Torch.Tensors; use Torch.Tensors;

with Ada_C_Error_Codes;

package body Torch.NN is

   overriding procedure Initialize (M : in out Module) is
   begin
      -- We promise that the M'Access pointer will only be used by the
      --  C-side functions while the object on the Ada side
      --  exists. This will be ensured by making Ada record to be the
      --  ownner the allocated C++ object that holds the Ada object
      --  reference, to never let that reference to outside, and to
      --  let the Initilaize and Finalize handle the shared
      --  pointers. The Ada object is of Linited_Controlled type,
      --  making sure that it is never copied. We will also make the
      --  Ada Module type limited so that no bitwise copy of the type
      --  can occur. Thus, we exepect the use of 'Unchecked_Access to
      --  be safe:
      
      M.Shadow_Module := New_AdaShadowModule (M'Unchecked_Access);
      
      if M.Shadow_Module = null then
         raise STORAGE_ERROR with
           "C++ side could not allocate PyTorch module for Ada";
      end if;
   end;

   overriding procedure Finalize (M : in out Module) is
   begin
      if M.Shadow_Module /= null then
         Delete_AdaShadowModule (M.Shadow_Module);
      end if;
   end;
   
   function Forward (Self : in out Module; X : Tensor) return Tensor is
   begin
      return X;
   end;
   
   function Call_Ada_Forward_Method
     (
      M : Module_Class_Access;
      X : Shadow_Tensor_Access;
      Result : Shadow_Tensor_Access
     ) return Shadow_Tensor_Access
   is
      R, T : Tensor;
   begin
      Copy (T, X);
      -- Do something with the T.Shadow_Tensor here – add NN layers, etc.
      R := M.Forward (T);
      Copy (Result, R);
      return Result;
   end;
   
   -- ------------------------------------------------------------------------
   
   overriding procedure Finalize (CO : in out Conv2d_Options) is
   begin
      Put_Line ("Running ""Finalize"" for ""Conv2d_Options""");
      if CO.Shadow_Conv2d_Options /= null then
         Delete_AdaShadowConv2dOptions (CO.Shadow_Conv2d_Options);
      end if;
   end;      

   function Make_Conv2d_Options (X, Y : Int64_T; Kernel_Size : Int64_T)
                                return Conv2d_Options 
   is
   begin
      return (
              Ada.Finalization.Limited_Controlled with
              Shadow_Conv2d_Options =>
                New_AdaShadowConv2dOptions (X, Y, Kernel_Size)
             );
   end;
   
   -- ------------------------------------------------------------------------
   
   overriding procedure Initialize (C : in out Conv2d) is
   begin
      Put_Line ("Running ""Initialize"" for ""Conv2d""");
      C.Shadow_Conv2d := New_AdaShadowConv2d (C'Unchecked_Access);
      
      if C.Shadow_Conv2d = null then
         raise STORAGE_ERROR with
           "C++ side could not allocate PyTorch Conv2d object for Ada";
      end if;
   end;
   
   overriding procedure Finalize (C : in out Conv2d) is
   begin
      Put_Line ("Running ""Finalize"" for ""Conv2d""");
      if C.Shadow_Conv2d /= null then
         Delete_AdaShadowConv2d (C.Shadow_Conv2d);
      end if;
   end;      
   
   procedure Ada_Shadow_Conv2d_Set_Self (C : Shadow_Conv2d_Access;
                                         A : Conv2d_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "AdaShadowConv2d_set_self";
   
   function Make_Conv2d (Options : Conv2d_Options'Class) return Conv2d is
   begin
      return Retval : Conv2d :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Conv2d =>
           New_AdaShadowConv2d_For_Options (Options.Shadow_Conv2d_Options)
        )
      do
         Ada_Shadow_Conv2d_Set_Self (C => Retval.Shadow_Conv2d,
                                     A => Retval'Unchecked_Access);
      end return;
   end;
   
   function Make_Conv2d (X, Y : Int64_T; Kernel_Size : Int64_T) return Conv2d is
      Options : Conv2d_Options := Make_Conv2d_Options (X, Y, Kernel_Size);
   begin
      return Retval : Conv2d :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Conv2d =>
           New_AdaShadowConv2d_For_Options (Options.Shadow_Conv2d_Options)
        )
      do
         Ada_Shadow_Conv2d_Set_Self (C => Retval.Shadow_Conv2d,
                                     A => Retval'Unchecked_Access);
      end return;
   end;
   
   -- -------------------------------------------------------------------------
   
   procedure Shadow_Register_Module (SM : Shadow_Module_Access; CL : Shadow_Conv2d_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowConv2d_for_options";
   
   procedure Register_Module (M : Module'Class; Layer : Conv2d'Class) is
   begin
      Shadow_Register_Module (M.Shadow_Module, Layer.Shadow_Conv2d);
   end;

   
end;
