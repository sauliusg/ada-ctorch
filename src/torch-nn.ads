with Ada.Finalization;

with Torch.Tensors; use Torch.Tensors;

package Torch.NN is
   
   type Module is new Ada.Finalization.Limited_Controlled with private;
   
   overriding
   procedure Initialize (M : in out Module);
   
   overriding
   procedure Finalize (M : in out Module);
   
   function Forward (Self : in out Module; X : Tensor) return Tensor;
   
   -- ------------------------------------------------------------------------
   
   subtype Int64_T is Long_Integer range -2**31 .. 2**31-1;
   
   type Conv2d_Options is new Ada.Finalization.Limited_Controlled with private;
   
   overriding
   procedure Finalize (CO : in out Conv2d_Options);
   
   function Make_Conv2d_Options
     (
      X, Y : Int64_T;
      Kernel_Size : Int64_T
     ) return Conv2d_Options;
   
   -- ------------------------------------------------------------------------
   
   type Conv2d is new Ada.Finalization.Limited_Controlled with private;
   
   overriding
   procedure Initialize (C : in out Conv2d);
   
   overriding
   procedure Finalize (C : in out Conv2d);
   
   function Make_Conv2d (Options : Conv2d_Options'Class) return Conv2d;
   
   function Make_Conv2d (X, Y : Int64_T; Kernel_Size : Int64_T) return Conv2d;
   
   --    procedure Register_Module (M : Module'Class; Layer : Conv2d'Class);
   
   -- -------------------------------------------------------------------------
   
   -- Functions for registering different (sub)modules:
   
   procedure Register_Module (M : Module'Class; Layer : Conv2d'Class);
   
private
   
   type Module_Access is access all Module;
   
   type Module_Class_Access is access all Module'Class;
   
   type Shadow_Module_Type is null record; -- Declared in full and managed on the C++ side
   
   type Shadow_Module_Access is access Shadow_Module_Type;
   
   type Module is new Ada.Finalization.Limited_Controlled with record
      Shadow_Module : Shadow_Module_Access; 
   end record;
   
   function New_AdaShadowModule (M : Module_Access) return Shadow_Module_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowModule";
   
   procedure Delete_AdaShadowModule (SM : Shadow_Module_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_AdaShadowModule";
   
   function Call_Ada_Forward_Method
     (
      M : Module_Class_Access;
      X : Shadow_Tensor_Access;
      Result : Shadow_Tensor_Access
     ) return Shadow_Tensor_Access
     with
     Export => True,
     Convention => CPP,
     External_Name => "call_ada_forward_method";

   -- ------------------------------------------------------------------------
   
   type Conv2d_Options_Access is access all Conv2d_Options;
   
   type Conv2d_Options_Class_Access is access all Conv2d_Options'Class;
   
   -- Declared in full and managed on the C++ side:
   type Shadow_Conv2d_Options_Type is null record;
   
   type Shadow_Conv2d_Options_Access is access Shadow_Conv2d_Options_Type;
   
   type Conv2d_Options is new Ada.Finalization.Limited_Controlled with record
      Shadow_Conv2d_Options : Shadow_Conv2d_Options_Access;
   end record;
   
   function New_AdaShadowConv2dOptions (X, Y : Int64_T;
                                        Kernel_Size : Int64_T
                                       ) return Shadow_Conv2d_Options_Access
   with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowConv2dOptions";
   
   procedure Delete_AdaShadowConv2dOptions (SC : Shadow_Conv2d_Options_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_AdaShadowConv2dOptions";
   
   -- ------------------------------------------------------------------------
   
   type Conv2d_Access is access all Conv2d;
   
   type Conv2d_Class_Access is access all Conv2d'Class;
   
   type Shadow_Conv2d_Type is null record; -- Declared in full and managed on the C++ side
   
   type Shadow_Conv2d_Access is access Shadow_Conv2d_Type;
   
   type Conv2d is new Ada.Finalization.Limited_Controlled with record
      Shadow_Conv2d : Shadow_Conv2d_Access;
   end record;
   
   function New_AdaShadowConv2d (CA : Conv2d_Access) return Shadow_Conv2d_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowConv2d";
   
   function New_AdaShadowConv2d_For_Options (CO : Shadow_Conv2d_Options_Access)
                                            return Shadow_Conv2d_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowConv2d_for_options";
   
   procedure Delete_AdaShadowConv2d (SC : Shadow_Conv2d_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_AdaShadowConv2d";
   
end Torch.NN;
