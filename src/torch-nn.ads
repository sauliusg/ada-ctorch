with Ada.Finalization;

package Torch.NN is
   
   type Ada_Module_Type is new Ada.Finalization.Controlled with private;
   
private
   
   type Ada_Shadow_Module_Type is null record; -- Declared in full and managed on the C++ side
   
   type Ada_Shadow_Module_Access is access Ada_Shadow_Module_Type;
   
   type Ada_Module_Type is new Ada.Finalization.Controlled with record
      Shadow_Module : Ada_Shadow_Module_Access; 
   end record;
   
end Torch.NN;
