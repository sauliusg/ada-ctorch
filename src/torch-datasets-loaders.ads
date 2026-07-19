with Ada.Finalization;

with Torch.Datasets; use Torch.Datasets;

with Ada_Dataloader_Codes_H; use Ada_Dataloader_Codes_H;

package Torch.Datasets.Loaders is
   
   -- -------------------------------------------------------------------------
   
   type Batch_Type is tagged private;
   
   function Data (B : Batch_Type) return Tensor;
   
   function Target (B : Batch_Type) return Tensor;
   
   type Batch_Cursor_Type is tagged private;   
   
   -- -------------------------------------------------------------------------
   
   -- Iterator implementation is done according to:
   -- https://gcc.gnu.org/onlinedocs/gcc-14.3.0/gnat_rm/Aspect-Iterable.html
   -- S.G.
   
   type Data_Loader_Mode is (Invalid, Sequential, Random);
   
   for Data_Loader_Mode use
     (
      Invalid    => Ada_Dataloader_Code_Enum_Ada_Dataloader_Invalid,
      Sequential => Ada_Dataloader_Code_Enum_Ada_Dataloader_Sequential,
      Random     => Ada_DataLoader_Code_Enum_ADA_DATALOADER_RANDOM
     );
   
   type Data_Loader_Type is tagged limited private
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
   
   function Make_Data_Loader
     (
      D : Dataset;
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
   procedure Finalize (Cursor : in out Batch_Cursor_Type);
   
   overriding
   procedure Adjust (Cursor : in out Batch_Cursor_Type);
   
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
   
   function Clone_Shadow_Batch (SB : Shadow_Batch_Access)
                               return Shadow_Batch_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "clone_ada_shadow_batch";
   
   procedure Delete_Shadow_Batch (SB : Shadow_Batch_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_ada_shadow_batch";
   
   function New_AdaShadowTensor_Batch_Data(S : Shadow_Batch_Access)
                                          return Shadow_Tensor_Access
   with
     Import => True,
     Convention => Cpp,
     External_Name => "new_AdaShadowTensor_batch_data";
   
   function New_AdaShadowTensor_Batch_Target(S : Shadow_Batch_Access)
                                            return Shadow_Tensor_Access
   with
     Import => True,
     Convention => Cpp,
     External_Name => "new_AdaShadowTensor_batch_target";
   
   -- -------------------------------------------------------------------------
   
   -- declared and managed on the C++ side:
   type Ada_Shadow_Data_Loader_Type is null record;
   
   type Ada_Shadow_Data_Loader_Access is access all 
     Ada_Shadow_Data_Loader_Type;
   
   type Data_Loader_Type is
     new Ada.Finalization.Limited_Controlled with 
      record
         Shadow_Data_Loader : Ada_Shadow_Data_Loader_Access;
      end record;

   overriding
   procedure Finalize (L : in out Data_Loader_Type);
   
   -- -------------------------------------------------------------------------
   -- C++ side functions for Shadow Iterators:
   
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
