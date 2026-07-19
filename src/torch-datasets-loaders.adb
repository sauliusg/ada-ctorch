with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.Source_Info; use GNAT.Source_Info;

package body Torch.Datasets.Loaders is
   
   procedure Delete_Ada_Shadow_Data_Loader (L : Ada_Shadow_Data_Loader_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_ada_shadow_data_loader";     
   
   overriding
   procedure Finalize (L : in out Data_Loader_Type) is
   begin
      Delete_Ada_Shadow_Data_Loader (L.Shadow_Data_Loader);
   end;
   
   -- -------------------------------------------------------------------------
   -- C++ side allocating function for the data loader:
   
   function New_Ada_Shadow_Data_Loader
     (
      D : Ada_Shadow_Dataset_Access;
      Batch_Size : Int64_T;
      Sampler_Kind : Ada_Dataloader_Code;
      E : Ada_C_Error_Access
     )
     return Ada_Shadow_Data_Loader_Access
   with 
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_data_loader";
   
   function Make_Data_Loader
     (
      D : Dataset; 
      Batch_Size : Int64_T;
      Mode : Data_Loader_Mode
     )
     return Data_Loader_Type is
      
      Err : aliased Ada_C_Error_Type;
      
   begin
      return Ret : Data_Loader_Type :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Data_Loader =>
           New_Ada_Shadow_Data_Loader
             (
              D.Shadow_Dataset,
              Batch_Size,
              Data_Loader_Mode'Enum_Rep (Mode),
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   -- -------------------------------------------------------------------------
   -- Batch_Type
   
   overriding
   procedure Finalize (Batch : in out Batch_Type) is
      Counter : Int64_T;
   begin
      Delete_Shadow_Batch (Batch.Shadow_Batch);
   end;
   
   overriding
   procedure Adjust (Batch : in out Batch_Type) is
   begin
      Batch.Shadow_Batch := Clone_Shadow_Batch (Batch.Shadow_Batch);
   end;
   
   function Data (B : Batch_Type) return Tensor is
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => New_AdaShadowTensor_Batch_Data (B.Shadow_Batch)
        )
      do
         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "Could not allocated tensor for data in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end;
   
   function Target (B : Batch_Type) return Tensor is
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => New_AdaShadowTensor_Batch_Target (B.Shadow_Batch)
        )
      do
         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "Could not allocated tensor for data in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end;
   
   -- -------------------------------------------------------------------------
   -- Iterator infrastructure:   
   
   -- -------------------------------------------------------------------------
   -- Batch_Cursor_Type
   
   procedure Release_Reference (I : Shadow_Iterator_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "ada_shadow_iterator_holder_release_reference";
   
   procedure Increment_Reference (I : Shadow_Iterator_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "ada_shadow_iterator_holder_inc_reference";
   
   overriding
   procedure Finalize (Cursor : in out Batch_Cursor_Type) is
   begin
      Release_Reference (Cursor.Current_Shadow_Iterator);
      Release_Reference (Cursor.End_Shadow_Iterator);
      
      Cursor.Current_Shadow_Iterator := null;
      Cursor.End_Shadow_Iterator := null;
   end;
   
   overriding
   procedure Adjust (Cursor : in out Batch_Cursor_Type) is
   begin
      Increment_Reference (Cursor.Current_Shadow_Iterator);
      Increment_Reference (Cursor.End_Shadow_Iterator);
   end;
   
   -- Initialise iterators:
   
   function New_Ada_Shadow_Iterator_Start (L : Ada_Shadow_Data_Loader_Access;
                                           E : Ada_C_Error_Access)
                                          return Shadow_Iterator_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_iterator_start";
   
   function New_Ada_Shadow_Iterator_End (L : Ada_Shadow_Data_Loader_Access;
                                         E : Ada_C_Error_Access)
                                        return Shadow_Iterator_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_iterator_end";
   
   function Start (Container : Data_Loader_Type)
                  return Batch_Cursor_Type'Class is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Batch_Cursor_Type :=
        (
         Ada.Finalization.Controlled with
         Current_Shadow_Iterator =>
           New_Ada_Shadow_Iterator_Start
             (
              Container.Shadow_Data_Loader,
              Err'Unchecked_Access
             ),
         End_Shadow_Iterator =>
           New_Ada_Shadow_Iterator_End
             (
              Container.Shadow_Data_Loader,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   function Advance
     (
      Container : Data_Loader_Type;
      Position  : in out Batch_Cursor_Type'Class
     ) return Batch_Cursor_Type'Class is
   begin
      Advance_Shadow_Iterator (Position.Current_Shadow_Iterator);
      return Position;
   end;
   
   function Has_Element
     (
      Container : Data_Loader_Type;
      Position  : Batch_Cursor_Type'Class
     ) return Boolean is
   begin
      return
        (
         Position.Current_Shadow_Iterator /= null and then
           Shadow_Iterarors_Are_Equal
             (
              Position.Current_Shadow_Iterator,
              Position.End_Shadow_Iterator
             ) = 0
        );
   end;
   
   function Element_Value
     (
      Container : Data_Loader_Type;
      Cursor    : Batch_Cursor_Type'Class
     ) return Batch_Type'Class
   is
   begin
      return Ret : Batch_Type := 
        (
         Ada.Finalization.Controlled with
         Shadow_Batch => New_Shadow_Batch (Cursor.Current_Shadow_Iterator)
        )
      do
         if Ret.Shadow_Batch = null then
            raise Storage_Error with
              "Could not allocate memory for the batch on the C++ side in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end;
   
end;
