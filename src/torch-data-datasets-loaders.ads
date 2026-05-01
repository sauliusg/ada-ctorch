with Ada.Finalization;
with Ada.Iterator_Interfaces;

with Torch.Data.Datasets; use Torch.Data.Datasets;

package Torch.Data.Datasets.Loaders is
   
   -- -------------------------------------------------------------------------
   
   type Data_Loader_Mode is (Sequential, Random);
   
   type Batch_Type is private;
   
   type Batch_Cursor_Type is private;   
   
   function Has_Element (Cursor : Batch_Cursor_Type) return Boolean;
   
   package Data_Loader_Iterator_Interface is
     new Ada.Iterator_Interfaces (Batch_Cursor_Type, Has_Element);   
      
   type Data_Loader_Type (Mode : Data_Loader_Mode := Sequential) is
     tagged limited private
   with
     Default_Iterator => Iterate,
     Iterator_Element => Batch_Type,
     Variable_Indexing => Batch_Reference;
   
   function Iterate (D : Data_Loader_Type)
                    return Data_Loader_Iterator_Interface
                      .Forward_Iterator'Class;
   
   type Batch_Reference_Type (Batch : not null access Batch_Type) is null record
   with
     Implicit_Dereference => Batch;
   
   function Make_Batch_Reference (Loader : aliased in out Data_Loader_Type)
                                 return Batch_Reference_Type;
   
   function Batch_Reference
     (
      Loader   : aliased in out Data_Loader_Type;
      Position : in Batch_Cursor_Type
     ) return Batch_Reference_Type;
   
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
   
   type Batch_Type is null record;
   
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
   -- Iterator infrastructure:
   
   type Batch_Cursor_Record is null record;
   
   -- Changing the location of the Batch_Cursor_Type declaration leads
   -- to obscure compilation errors:
   type Batch_Cursor_Type is access Batch_Cursor_Record;
   
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
