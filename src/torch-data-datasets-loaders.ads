with Ada.Finalization;

with Torch.Data.Datasets; use Torch.Data.Datasets;

package Torch.Data.Datasets.Loaders is
   
   -- -------------------------------------------------------------------------
   
   type Data_Loader_Mode is (Sequential, Random);
   
   type Batch_Type is tagged private;
   
   type Batch_Cursor_Type is tagged private;   
   
   -- Iterator implementation done according to:
   -- https://gcc.gnu.org/onlinedocs/gcc-14.3.0/gnat_rm/Aspect-Iterable.html
   -- S.G.
   
   type Data_Loader_Type (Mode : Data_Loader_Mode := Sequential) is
     tagged limited private
   with
     Iterable =>
       (
        First       => Start,
        Next        => Advance,
        Has_Element => Has_Element,
        Element     => Element_Value
       );
   
   function Start (Container : Data_Loader_Type) return Batch_Cursor_Type'Class;
   
   function Advance
     (
      Container : Data_Loader_Type;
      Position  : Batch_Cursor_Type'Class
     ) return Batch_Cursor_Type'Class;
   
   function Has_Element
     (
      Container : Data_Loader_Type;
      Position : Batch_Cursor_Type'Class
     ) return Boolean;
   
   function Element_Value
     (
      Container : Data_Loader_Type;
      Cursor    : Batch_Cursor_Type'Class
     ) return Batch_Type'Class;
   
   -- -------------------------------------------------------------------------
   
   function Make_Mnist_Data_Loader
     (
      Dataset : MNIST;
      Batch_Size : Int64_T;
      Mode : Data_Loader_Mode
     )
     return Data_Loader_Type;
   
private
   
   -- -------------------------------------------------------------------------
   -- Iterator infrastructure:
   
   -- Created and managed on the C++ side:
   type Shadow_Iterator_Type is null record; 
   
   type Shadow_Iterator_Access is access Shadow_Iterator_Type;
  
   type Batch_Cursor_Type is new Ada.Finalization.Controlled with
      record
         Current_Shadow_Iterator : Shadow_Iterator_Access;
         End_Shadow_Iterator     : Shadow_Iterator_Access;
      end record;
   
   -- -------------------------------------------------------------------------
   
   -- Created and managed on the C++ side:
   type Shadow_Batch_Type is null record;
   
   type Shadow_Batch_Access is access Shadow_Batch_Type;
      
   type Batch_Type is new Ada.Finalization.Controlled with
      record
         Shadow_Batch : Shadow_Batch_Access;
      end record;
   
   -- -------------------------------------------------------------------------
   
   -- declared and managed on the C++ side:
   type Shadow_Data_Sequential_Loader_Type is null record;
   
   type Shadow_Data_Sequential_Loader_Access is access all 
     Shadow_Data_Sequential_Loader_Type;
   
   type Shadow_Data_Random_Loader_Type is null record;
   
   type Shadow_Data_Random_Loader_Access is access all 
     Shadow_Data_Random_Loader_Type;
   
   type Data_Loader_Type (Mode : Data_Loader_Mode := Sequential) is
     new Ada.Finalization.Limited_Controlled with 
      record
         case Mode is
            
            when Sequential =>
               Shadow_Sequential_Data_Loader :
                 Shadow_Data_Sequential_Loader_Access;
               
            when Random =>
               Shadow_Random_Data_Loader :
                 Shadow_Data_Random_Loader_Access;
            
         end case;
      end record;

   overriding
   procedure Finalize (L : in out Data_Loader_Type);
   
   -- -------------------------------------------------------------------------
   -- C++ side allocating functions:
   
   function New_MNIST_Data_Loader_Sequential_Sampler
     (
      D : Shadow_Stacked_MNIST_Access;
      Batch_Size : Int64_T;
      E : Ada_C_Error_Access
     ) return Shadow_Data_Sequential_Loader_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_mnist_data_loader_sequential_sampler";
   
   procedure Delete_MNIST_Data_Loader_Sequential_Sampler
     (S : Shadow_Data_Sequential_Loader_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_mnist_data_loader_sequential_sampler";
      
   function New_MNIST_Data_Loader_Default_Sampler
     (
      D : Shadow_Stacked_MNIST_Access;
      Batch_Size : Int64_T;
      E : Ada_C_Error_Access
     ) return Shadow_Data_Random_Loader_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_mnist_data_loader_default_sampler";
   
   procedure Delete_MNIST_Data_Loader_Default_Sampler
     (S : Shadow_Data_Random_Loader_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_mnist_data_loader_default_sampler";
      
end;
