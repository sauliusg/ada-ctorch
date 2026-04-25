with Ada.Finalization;
with Torch.Data.Datasets; use Torch.Data.Datasets;

package Torch.Data.Datasets.Loaders is
   
   type Data_Loader_Mode is (Sequential, Random);
   
   type Data_Loader_Type (Mode : Data_Loader_Mode := Sequential) is
     new Ada.Finalization.Limited_Controlled 
     with private;
   
   overriding
   procedure Finalize (L : in out Data_Loader_Type);
   
   function Make_Mnist_Data_Loader
     (
      Dataset : MNIST;
      Batch_Size : Int64_T;
      Mode : Data_Loader_Mode
     )
     return Data_Loader_Type;
   
private
   
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
