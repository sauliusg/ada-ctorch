with Ada.Finalization; use Ada.Finalization;

package Torch.Optim is
   
   type SGD_Type is new Ada.Finalization.Controlled with private;
   
   type SGD_Options_Type is new Ada.Finalization.Controlled with private;
   
private
   
   type SGD_Type is new Ada.Finalization.Controlled with null record;
   
   type SGD_Options_Type is new Ada.Finalization.Controlled with null record;
   
end;
