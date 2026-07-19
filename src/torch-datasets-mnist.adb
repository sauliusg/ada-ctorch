with Interfaces.C;

with Ada_C_Error_Codes; use Ada_C_Error_Codes;

package body Torch.Datasets.MNIST is
   
   function New_Ada_Shadow_MNIST (Dir_Name : Chars_Ptr;
                                  Mode : UInt8_T;
                                  E : Ada_C_Error_Access)
                                 return Ada_Shadow_Dataset_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_mnist";
   
   function Make_MNIST (Dir_Name : String;
                        Mode : Dataset_Mode := Train)
                       return Dataset is
      Dir_Name_Chars : aliased Char_Array := To_C (Dir_Name);
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Dataset :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Dataset =>
           New_Ada_Shadow_MNIST 
             (
              To_Chars_Ptr (Dir_Name_Chars'Unchecked_Access),
              Dataset_Mode'Pos (Mode),
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   function New_Ada_Shadow_Normalised_MNIST (Dir_Name : Chars_Ptr;
                                             X, Y : Interfaces.C.Double;
                                             Mode : UInt8_T;
                                             E : Ada_C_Error_Access)
                                            return Ada_Shadow_Dataset_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_normalised_mnist";
   
   function Make_Normalised_MNIST (Dir_Name : String;
                                   X, Y : Long_Float;
                                   Mode : Dataset_Mode := Train)
                                  return Dataset is
      subtype Double is Interfaces.C.double;
      Dir_Name_Chars : aliased Char_Array := To_C (Dir_Name);
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Dataset :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Normalised_Mnist =>
           New_Ada_Shadow_Normalised_MNIST 
             (
              To_Chars_Ptr (Dir_Name_Chars'Unchecked_Access),
              Double (X), Double (Y),
              Dataset_Mode'Pos (Mode),
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   function New_Ada_Shadow_Stacked_MNIST (Dir_Name : Chars_Ptr;
                                          Mode : UInt8_T;
                                          E : Ada_C_Error_Access)
                                         return Ada_Shadow_Dataset_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_stacked_mnist";
   
   function Make_Stacked_MNIST (Dir_Name : String;
                                Mode : Dataset_Mode := Train) 
                               return Dataset is
      Dir_Name_Chars : aliased Char_Array := To_C (Dir_Name);
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Dataset :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Stacked_Mnist =>
           New_Ada_Shadow_Stacked_Mnist
             (
              To_Chars_Ptr (Dir_Name_Chars'Unchecked_Access),
              Dataset_Mode'Pos (Mode),
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   function New_Ada_Shadow_Normalised_Stacked_Mnist
     (
      Dir_Name : Chars_Ptr;
      X, Y : Interfaces.C.Double;
      Mode : UInt8_T;
      E : Ada_C_Error_Access
     )
     return Ada_Shadow_Dataset_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_normalised_mnist";
   
   function Make_Normalised_Stacked_Mnist
     (
      Dir_Name : String;
      X, Y : Long_Float;
      Mode : Dataset_Mode := Train)
     return Dataset is
      
      subtype Double is Interfaces.C.double;
      Dir_Name_Chars : aliased Char_Array := To_C (Dir_Name);
      Err : aliased Ada_C_Error_Type;
      
   begin
      return Ret : Dataset :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Normalised_Mnist =>
           New_Ada_Shadow_Normalised_Stacked_MNIST
             (
              To_Chars_Ptr (Dir_Name_Chars'Unchecked_Access),
              Double (X), Double (Y),
              Dataset_Mode'Pos (Mode),
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;
   
end;
