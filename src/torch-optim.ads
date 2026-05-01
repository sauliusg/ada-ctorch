with Ada.Finalization; use Ada.Finalization;

with Interfaces.C;

package Torch.Optim is
   
   type SGD_Type is tagged limited private;
   
   -- -------------------------------------------------------------------------
   
   type SGD_Options_Type is new Ada.Finalization.Limited_Controlled with 
     private;
   
   overriding
   procedure Finalize (SGD : in out SGD_Options_Type);
   
   function Make_SGD_Options (Learning_Rate : Long_Float)
                             return SGD_Options_Type;
   
   function Make_SGD_Options (Learning_Rate : Long_Float;
                              Momentum : Long_Float)
                             return SGD_Options_Type;
   
   procedure Set_Momentum (SGD : in out SGD_Options_Type;
                           Momentum : Long_Float);
   
private
   
   -- -------------------------------------------------------------------------
   -- Shadow_SGD_Options_Type
   
    -- created and managed on the C++ side:
   type Shadow_SGD_Options_Type is null record;
   
   type Shadow_SGD_Options_Access is access Shadow_SGD_Options_Type;
   
   type SGD_Options_Type is new Ada.Finalization.Limited_Controlled with
      record
         Shadow_SGD_Options : Shadow_SGD_Options_Access;
      end record;
   
   subtype Double is Interfaces.C.double;
   
   function New_Shadow_SGD_Options (Learning_Rate : Double)
                                   return Shadow_SGD_Options_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_sgd_options";
   
   procedure Delete_Shadow_SGD_Options (O : Shadow_SGD_Options_Access)
   with
     Import => True, 
     Convention => CPP,
     External_Name => "delete_sgd_options";
   
   procedure Set_Momentum (O : Shadow_SGD_Options_Access; Momentum : Double)
   with
     Import => True, 
     Convention => CPP,
     External_Name => "set_momentum";
   
   -- -------------------------------------------------------------------------
   -- Shadow_SGD_Type
   
   -- created and managed on the C++ side:
   type Shadow_SGD_Type is null record;

   type Shadow_SGD_Access is access Shadow_SGD_Type;
   
   type SGD_Type is new Ada.Finalization.Limited_Controlled with
      record
         Shadow_SGD : Shadow_SGD_Access;
      end record;
   
   overriding
   procedure Finalize (SGD : in out SGD_Type);
   
   function New_SGD (Parameters : Shadow_Vector_Of_Tensor_Access;
                     Options : Shadow_SGD_Options_Access)
                    return Shadow_SGD_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_sgd";
   
   procedure Delete_SGD (S : Shadow_SGD_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_sgd";
   
end;
