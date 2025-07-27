with Ada.Finalization;

package Torch.NN is
   
   type Module is new Ada.Finalization.Limited_Controlled with private;
   
   overriding
   procedure Initialize (M : in out Module);
   
   overriding
   procedure Finalize (M : in out Module);
   
private
   
   type Module_Access is access all Module;
   
   type Ada_Shadow_Module_Type is null record; -- Declared in full and managed on the C++ side
   
   type Ada_Shadow_Module_Access is access Ada_Shadow_Module_Type;
   
   function New_AdaShadowModule (M : Module_Access) return Ada_Shadow_Module_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowModule";
   
   procedure Delete_AdaShadowModule (SM : Ada_Shadow_Module_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_AdaShadowModule";
   
   type Module is new Ada.Finalization.Limited_Controlled with record
      Shadow_Module : Ada_Shadow_Module_Access; 
   end record;
   
end Torch.NN;
