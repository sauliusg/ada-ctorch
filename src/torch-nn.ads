with Ada.Finalization;

with Torch.Tensors; use Torch.Tensors;

package Torch.NN is
   
   type Module is new Ada.Finalization.Limited_Controlled with private;
   
   overriding
   procedure Initialize (M : in out Module);
   
   overriding
   procedure Finalize (M : in out Module);
   
private
   
   type Module_Access is access all Module;
   
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
      M : Module_Access;
      X : Shadow_Tensor_Access;
      Result : Shadow_Tensor_Access
     ) return Shadow_Tensor_Access
     with
     Export => True,
     Convention => CPP,
     External_Name => "call_ada_forward_method";

end Torch.NN;
