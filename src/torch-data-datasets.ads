with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with Ada.Finalization;

package Torch.Data.Datasets is
   
   type MNIST_Dataset_Mode is (Test, Training);
   
   type MNIST_Dataset_Kind is (Plain, Normalised, Stacked);
   
   type MNIST (Kind : MNIST_Dataset_Kind := Plain) is new 
     Ada.Finalization.Limited_Controlled with private;

   overriding
   procedure Finalize (C : in out MNIST);
   
   function Make_MNIST (Dir_Name : String) return MNIST;
   
   function Make_Normalised_MNIST (M : MNIST; X, Y : Long_Float) return MNIST;
   
   function Make_Stacked_MNIST (M : MNIST) return Mnist;
   
   function Make_Stacked_Normalised_MNIST (M : Mnist; X, Y : Long_Float)
                                          return Mnist;
   
   function Make_Stacked_Normalised_MNIST (Dir : String; X, Y : Long_Float)
                                          return Mnist;
   
   function Size (M : MNIST) return UInt64_T;
   
private
   
   -- =========================================================================
   -- MNIST:
   
   -- declared in full and managed on the C++ side:
   type Shadow_MNIST_Type is null record;
   
   type Shadow_MNIST_Access is access Shadow_MNIST_Type;
   
   function New_MNIST_Dataset (Dir_Name : Chars_Ptr;
                               E : Ada_C_Error_Access)
                              return Shadow_MNIST_Access
   with Import => True,
     Convention => CPP,
     External_Name => "new_mnist_dataset";
   
   procedure Delete_MNIST_Dataset (SC : Shadow_MNIST_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "delete_mnist_dataset";
   
   function MNIST_Dataset_Size (M : Shadow_MNIST_Access) return UInt64_T
   with Import => True,
     Convention => CPP,
     External_Name => "mnist_dataset_size";
   
   -- =========================================================================
   -- Normalised MNIST:
   
   -- declared in full and managed on the C++ side:
   type Shadow_Normalised_MNIST_Type is null record;
   
   type Shadow_Normalised_MNIST_Access is access Shadow_Normalised_MNIST_Type;
   
   function New_MNIST_Normaliser (Dataset : Shadow_MNIST_Access;
                                  X, Y : Interfaces.C.double) 
                                 return Shadow_Normalised_MNIST_Access
   with Import => True,
     Convention => CPP,
     External_Name => "new_mnist_normaliser";
   
   procedure Delete_MNIST_Normaliser (SC : Shadow_Normalised_MNIST_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "delete_mnist_normaliser";
   
   function MNIST_Dataset_Size (M : Shadow_Normalised_MNIST_Access) 
                               return UInt64_T
   with Import => True,
     Convention => CPP,
     External_Name => "mnist_dataset_size";
   
   -- =========================================================================
   -- Stacked MNIST:
   
   -- declared in full and managed on the C++ side:
   type Shadow_Stacked_MNIST_Type is null record;
   
   type Shadow_Stacked_MNIST_Access is access Shadow_Stacked_MNIST_Type;
   
   function New_MNIST_Stack (Dataset : Shadow_Normalised_MNIST_Access)
                            return Shadow_Stacked_MNIST_Access
   with Import => True,
     Convention => CPP,
     External_Name => "new_mnist_stack";
   
   procedure Delete_MNIST_Stack (Sc : Shadow_Stacked_MNIST_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "delete_mnist_stack";
   
   function MNIST_Dataset_Size (M : Shadow_Stacked_MNIST_Access) 
                               return UInt64_T
   with Import => True,
     Convention => CPP,
     External_Name => "mnist_dataset_size";
   
   -- =========================================================================
   -- MNIST (Ada side):
   
   type MNIST (Kind : MNIST_Dataset_Kind := Plain) is new
     Ada.Finalization.Limited_Controlled with
      record
         case Kind is
            when Plain =>
               Shadow_MNIST : Shadow_Mnist_Access;
            when Normalised =>
               Shadow_Normalised_MNIST : Shadow_Normalised_Mnist_Access;
            when Stacked =>
               Shadow_Stacked_MNIST : Shadow_Stacked_Mnist_Access;
         end case;
         
      end record;

end;
