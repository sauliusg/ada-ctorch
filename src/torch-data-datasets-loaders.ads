with Ada.Finalization;

with Torch.Data.Datasets; use Torch.Data.Datasets;

package Torch.Data.Datasets.Loaders is
   
   -- -------------------------------------------------------------------------
   
   type Batch_Type is tagged private;
   
   
   type Batch_Cursor_Type is tagged private;   
   
   -- -------------------------------------------------------------------------
   
   -- Iterator implementation is done according to:
   -- https://gcc.gnu.org/onlinedocs/gcc-14.3.0/gnat_rm/Aspect-Iterable.html
   -- S.G.
   
   type Data_Loader_Mode is (Sequential, Random);
   
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
      Position  : in out Batch_Cursor_Type'Class
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
   
   -- -------------------------------------------------------------------------
   -- Batch_Cursor_Type
   
   -- Created and managed on the C++ side:
   type Shadow_Iterator_Type is null record; 
   
   type Shadow_Iterator_Access is access Shadow_Iterator_Type;
   
   type Batch_Cursor_Type is new Ada.Finalization.Controlled with
      record
         Current_Shadow_Iterator : Shadow_Iterator_Access;
         End_Shadow_Iterator     : Shadow_Iterator_Access;
      end record;
   
   overriding
   procedure Finalize (Batch : in out Batch_Cursor_Type);
   
   overriding
   procedure Adjust (Batch : in out Batch_Cursor_Type);
   
   -- -------------------------------------------------------------------------
   
   -- Created and managed on the C++ side:
   type Shadow_Batch_Type is null record;
   
   type Shadow_Batch_Access is access Shadow_Batch_Type;
   
   type Batch_Type is new Ada.Finalization.Controlled with
      record
         Shadow_Batch : Shadow_Batch_Access;
      end record;
   
   overriding
   procedure Finalize (Batch : in out Batch_Type);
   
   overriding
   procedure Adjust (Batch : in out Batch_Type);
   
   function New_Shadow_Batch (SI : Shadow_Iterator_Access)
                             return Shadow_Batch_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_batch_from_iterator";
   
   procedure Delete_Shadow_Batch (SI : Shadow_Batch_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_ada_shadow_batch";
   
   procedure Inc_Refcount (S : Shadow_Batch_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "inc_ada_shadow_batch_refcount";
   
   function Dec_Refcount (S : Shadow_Batch_Access)
                         return Int64_T
   with
     Import => True,
     Convention => CPP,
     External_Name => "dec_ada_shadow_batch_refcount";
   
   function Get_Refcount (S : Shadow_Batch_Access)
                         return Int64_T
   with
     Import => True,
     Convention => CPP,
     External_Name => "get_ada_shadow_batch_refcount";
   
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
   -- C++ side allocating functions for the MNIST datasets:
   
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
   
   -- -------------------------------------------------------------------------
   -- C++ side functions for Shadow Iterators:
   
   function New_Sequential_Sampler_Iterator_Start (S : Shadow_Data_Sequential_Loader_Access)
                                                  return Shadow_Iterator_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_sequential_sampler_iterator";

   function New_Sequential_Sampler_Iterator_End (S : Shadow_Data_Sequential_Loader_Access)
                                                return Shadow_Iterator_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_sequential_sampler_iterator_end";

   function New_Default_Sampler_Iterator_Start (S : Shadow_Data_Random_Loader_Access)
                                               return Shadow_Iterator_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_default_sampler_iterator";

   function New_Default_Sampler_Iterator_End (S : Shadow_Data_Random_Loader_Access)
                                             return Shadow_Iterator_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_default_sampler_iterator_end";

   function Clone_Ada_Shadow_Iterator (S : Shadow_Iterator_Access)
                                      return Shadow_Iterator_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "clone_shadow_iterator";

   procedure Delete_Ada_Shadow_Iterator (S : Shadow_Iterator_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_ada_shadow_iterator_holder";
   
   procedure Advance_Shadow_Iterator (S : Shadow_Iterator_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "advance_iterator";
   
   function Shadow_Iterarors_Are_Equal (I1, I2 : Shadow_Iterator_Access)
                                       return Int8_T
   with
     Import => True,
     Convention => CPP,
     External_Name => "iterators_are_equal";
   
end;
