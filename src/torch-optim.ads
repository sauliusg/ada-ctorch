with Ada.Finalization; use Ada.Finalization;

with Interfaces.C;

package Torch.Optim is
   
   type SGD_Type is new Ada.Finalization.Limited_Controlled with
     private;
   
   overriding
   procedure Finalize (SGD : in out SGD_Type);
   
   type SGD_Options_Type is new Ada.Finalization.Limited_Controlled with 
     private;
   
   overriding
   procedure Finalize (SGD : in out SGD_Options_Type);
   
   function Make_SDG_Options (X : Long_Float) return SGD_Options_Type;
   
private
   
   -- created and managed on the C++ side:
   type Shadow_SGD_Type is null record;

   type Shadow_SGD_Access is access Shadow_SGD_Type;
   
   type SGD_Type is new Ada.Finalization.Limited_Controlled with
      record
         Shadow_SGD : Shadow_SGD_Access;
      end record;
   
   -- -------------------------------------------------------------------------
   
    -- created and managed on the C++ side:
   type Shadow_SGD_Options_Type is null record;
   
   type Shadow_SGD_Options_Access is access Shadow_SGD_Options_Type;
   
   type SGD_Options_Type is new Ada.Finalization.Limited_Controlled with
      record
         Shadow_SGD_Options : Shadow_SGD_Options_Access;
      end record;
   
   subtype Double is Interfaces.C.double;
   
   function New_Shadow_SGD_Options (X : Double) return Shadow_SGD_Options_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_sgd_options";
   
   procedure Delete_Shadow_SGD_Options (O : Shadow_SGD_Options_Access)
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "delete_sgd_options";
   
end;
