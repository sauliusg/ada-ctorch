with Ada.Text_IO; use Ada.Text_IO;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.Source_Info; use GNAT.Source_Info;

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
   
   function Is_Training (Self : in Module) return Boolean is
   begin
      return Module_Is_Training (Self.Shadow_Module) /= 0;
   end;
   
   -- ------------------------------------------------------------------------
   
   overriding procedure Finalize (CO : in out Conv1d_Options) is
   begin
      pragma Debug (Put_Line ("Running ""Finalize"" for ""Conv1d_Options"""));
      if CO.Shadow_Conv1d_Options /= null then
         Delete_AdaShadowConv1dOptions (CO.Shadow_Conv1d_Options);
      end if;
   end;      

   function Make_Conv1d_Options (X, Y : Int64_T; Kernel_Size : Int64_T)
                                return Conv1d_Options 
   is
   begin
      return (
              Ada.Finalization.Limited_Controlled with
              Shadow_Conv1d_Options =>
                New_AdaShadowConv1dOptions (X, Y, Kernel_Size)
             );
   end;
   
   -- ------------------------------------------------------------------------
   
   overriding procedure Initialize (C : in out Conv1d) is
   begin
      pragma Debug (Put_Line ("Running ""Initialize"" for ""Conv1d"""));
      C.Shadow_Conv1d := New_AdaShadowConv1d (C'Unchecked_Access);
      
      if C.Shadow_Conv1d = null then
         raise STORAGE_ERROR with
           "C++ side could not allocate PyTorch Conv1d object for Ada";
      end if;
   end;
   
   overriding procedure Finalize (C : in out Conv1d) is
   begin
      pragma Debug (Put_Line ("Running ""Finalize"" for ""Conv1d"""));
      if C.Shadow_Conv1d /= null then
         Delete_AdaShadowConv1d (C.Shadow_Conv1d);
      end if;
   end;      
   
   procedure Ada_Shadow_Conv1d_Set_Self (C : Shadow_Conv1d_Access;
                                         A : Conv1d_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "AdaShadowConv1d_set_self";
   
   function Make_Conv1d (Options : Conv1d_Options'Class) return Conv1d is
   begin
      return Retval : Conv1d :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Conv1d =>
           New_AdaShadowConv1d_For_Options (Options.Shadow_Conv1d_Options)
        )
      do
         Ada_Shadow_Conv1d_Set_Self (C => Retval.Shadow_Conv1d,
                                     A => Retval'Unchecked_Access);
      end return;
   end;
   
   function Make_Conv1d (X, Y : Int64_T; Kernel_Size : Int64_T) return Conv1d is
      Options : Conv1d_Options := Make_Conv1d_Options (X, Y, Kernel_Size);
   begin
      return Retval : Conv1d :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Conv1d =>
           New_AdaShadowConv1d_For_Options (Options.Shadow_Conv1d_Options)
        )
      do
         Ada_Shadow_Conv1d_Set_Self (C => Retval.Shadow_Conv1d,
                                     A => Retval'Unchecked_Access);
      end return;
   end;
   
   -- ------------------------------------------------------------------------
   
   overriding procedure Finalize (CO : in out Conv2d_Options) is
   begin
      pragma Debug (Put_Line ("Running ""Finalize"" for ""Conv2d_Options"""));
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
      pragma Debug (Put_Line ("Running ""Initialize"" for ""Conv2d"""));
      C.Shadow_Conv2d := New_AdaShadowConv2d (C'Unchecked_Access);
      
      if C.Shadow_Conv2d = null then
         raise STORAGE_ERROR with
           "C++ side could not allocate PyTorch Conv2d object for Ada";
      end if;
   end;
   
   overriding procedure Finalize (C : in out Conv2d) is
   begin
      pragma Debug (Put_Line ("Running ""Finalize"" for ""Conv2d"""));
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
   
   procedure Call_Conv2d_Forward_Method
     (
      Result : Shadow_Tensor_Access;
      M : Shadow_Conv2d_Access;
      X : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     )
     with
     Import => True,
     Convention => CPP,
     External_Name => "call_conv2d_forward_method";

   function Forward (Self : in out Conv2d; X: Tensor) return Tensor is
      Ret : Tensor;
      Err : aliased Ada_C_Error_Type;
   begin
      Call_Conv2d_Forward_Method (Ret.Shadow_Tensor, 
                                  Self.Shadow_Conv2d,
                                  X.Shadow_Tensor,
                                  Err'Unchecked_Access);
      if Err.Has_Error then
         Put_Line (Standard_Error, 
                   "STDERR: function """ & Enclosing_Entity &
                     """ raised exception " &
                     To_String (Err.Error_Message) &
                     " (code " & Err.Error_Code'Image & ")");
         Ada.Text_Io.Flush;
         raise PROGRAM_ERROR 
           with "ERROR, function """ & Enclosing_Entity &
           """ raised exception " &
           To_String (Err.Error_Message) &
           " (code " & Err.Error_Code'Image & ")";
      end if;
      return Ret;
   end;
   
   -- ------------------------------------------------------------------------
   
   overriding procedure Initialize (C : in out Linear) is
   begin
      pragma Debug (Put_Line ("Running ""Initialize"" for ""Linear"""));
      C.Shadow_Linear := New_AdaShadowLinear (C'Unchecked_Access);
      
      if C.Shadow_Linear = null then
         raise STORAGE_ERROR with
           "C++ side could not allocate PyTorch Linear object for Ada";
      end if;
   end;
   
   overriding procedure Finalize (C : in out Linear) is
   begin
      pragma Debug (Put_Line ("Running ""Finalize"" for ""Linear"""));
      if C.Shadow_Linear /= null then
         Delete_AdaShadowLinear (C.Shadow_Linear);
      end if;
   end;      
   
   procedure Ada_Shadow_Linear_Set_Self (C : Shadow_Linear_Access;
                                         A : Linear_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "AdaShadowLinear_set_self";
   
   function Make_Linear (X, Y : Int64_T) return Linear is
   begin
      return Retval : Linear :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Linear =>
           New_Adashadowlinear_XY (X, Y)
        )
      do
         Ada_Shadow_Linear_Set_Self (C => Retval.Shadow_Linear,
                                     A => Retval'Unchecked_Access);
      end return;
   end;
   
   procedure Call_Linear_Forward_Method
     (
      Result : Shadow_Tensor_Access;
      M : Shadow_Linear_Access;
      X : Shadow_Tensor_Access
     )
     with
     Import => True,
     Convention => CPP,
     External_Name => "call_linear_forward_method";

   function Forward (Self : in out Linear; X: Tensor) return Tensor is
      Ret : Tensor;
   begin
      Call_Linear_Forward_Method (Ret.Shadow_Tensor, 
                                  Self.Shadow_Linear,
                                  X.Shadow_Tensor);
      return Ret;
   end;
   
   -- ------------------------------------------------------------------------
   
   overriding procedure Initialize (C : in out Dropout2d) is
   begin
      pragma Debug (Put_Line ("Running ""Initialize"" for ""Dropout2d"""));
      C.Shadow_Dropout2d := New_AdaShadowDropout2d (C'Unchecked_Access);
      
      if C.Shadow_Dropout2d = null then
         raise STORAGE_ERROR with
           "C++ side could not allocate PyTorch Dropout2d object for Ada";
      end if;
   end;
   
   overriding procedure Finalize (C : in out Dropout2d) is
   begin
      pragma Debug (Put_Line ("Running ""Finalize"" for ""Dropout2d"""));
      if C.Shadow_Dropout2d /= null then
         Delete_AdaShadowDropout2d (C.Shadow_Dropout2d);
      end if;
   end;      
   
   procedure Call_Dropout2d_Forward_Method
     (
      Result : Shadow_Tensor_Access;
      M : Shadow_Dropout2d_Access;
      X : Shadow_Tensor_Access
     )
     with
     Import => True,
     Convention => CPP,
     External_Name => "call_dropout2d_forward_method";

   function Forward (Self : in out Dropout2d; X: Tensor) return Tensor is
      Ret : Tensor;
   begin
      Call_Dropout2d_Forward_Method (Ret.Shadow_Tensor, 
                                  Self.Shadow_Dropout2d,
                                  X.Shadow_Tensor);
      return Ret;
   end;
   
   -- -------------------------------------------------------------------------
   
   procedure Shadow_Register_Module (SM    : Shadow_Module_Access;
                                     CName : Chars_Ptr;
                                     CL    : Shadow_Conv2d_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "shadow_register_module_conv2d";
   
   procedure Register_Module (M     : Module'Class; 
                              Name  : String;
                              Layer : Conv2d'Class) is
      C_Name : aliased Char_Array := To_C (Name);
   begin
      if Layer.Shadow_Conv2d = null then
         raise PROGRAM_ERROR with
           "Null shadown layer ""Register_Module""";
      end if;
      if M.Shadow_Module = null then
         raise PROGRAM_ERROR with
           "Null shadown Module object at ""Register_Module""";
      end if;
      Shadow_Register_Module (M.Shadow_Module,
                              To_Chars_Ptr (C_Name'Unchecked_Access),
                              Layer.Shadow_Conv2d);
   end;
   
   procedure Shadow_Register_Module (SM    : Shadow_Module_Access;
                                     CName : Chars_Ptr;
                                     CL    : Shadow_Linear_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "shadow_register_module_conv2d";
   
   procedure Register_Module (M     : Module'Class; 
                              Name  : String;
                              Layer : Linear'Class) is
      C_Name : aliased Char_Array := To_C (Name);
   begin
      if Layer.Shadow_Linear = null then
         raise PROGRAM_ERROR with
           "Null shadown layer ""Register_Module""";
      end if;
      if M.Shadow_Module = null then
         raise PROGRAM_ERROR with
           "Null shadown Module object at ""Register_Module""";
      end if;
      Shadow_Register_Module (M.Shadow_Module,
                              To_Chars_Ptr (C_Name'Unchecked_Access),
                              Layer.Shadow_Linear);
   end;
   
   procedure Shadow_Register_Module (SM    : Shadow_Module_Access;
                                     CName : Chars_Ptr;
                                     CL    : Shadow_Dropout2d_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "shadow_register_module_conv2d";
   
   procedure Register_Module (M     : Module'Class; 
                              Name  : String;
                              Layer : Dropout2d'Class) is
      C_Name : aliased Char_Array := To_C (Name);
   begin
      if Layer.Shadow_Dropout2d = null then
         raise PROGRAM_ERROR with
           "Null shadown layer ""Register_Module""";
      end if;
      if M.Shadow_Module = null then
         raise PROGRAM_ERROR with
           "Null shadown Module object at ""Register_Module""";
      end if;
      Shadow_Register_Module (M.Shadow_Module,
                              To_Chars_Ptr (C_Name'Unchecked_Access),
                              Layer.Shadow_Dropout2d);
   end;
   
   function New_Parameters (S : Shadow_Module_Access) 
                           return Shadow_Vector_Of_Tensor_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_parameters";
   
   function Parameters (M : Module) return Vector_Of_Tensor_Type is
   begin
      return Ret : Vector_Of_Tensor_Type :=
        (
         Ada.Finalization.Controlled with
         Shadow_Vector => New_Parameters (M.Shadow_Module)
        )
      do
         if Ret. Shadow_Vector = null then
            raise Storage_Error with
              "Cold not allocate new module parameters on the C++ side " &
              "in """ & Enclosing_Entity & """";
         end if;
      end return;
   end;
   
   procedure Train_Shadow_Module (S : Shadow_Module_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "shadow_module_train";
   
   procedure Train (M : Module) is
   begin
      Train_Shadow_Module (M.Shadow_Module);
   end;

   procedure Eval_Shadow_Module (S : Shadow_Module_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "shadow_module_eval";
   
   procedure Eval (M : Module) is
   begin
      Train_Shadow_Module (M.Shadow_Module);
   end;
   
end;
