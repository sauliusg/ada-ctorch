with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.Source_Info; use GNAT.Source_Info;

package body Torch.Data.Datasets.Loaders is
   
   overriding
   procedure Finalize (L : in out Data_Loader_Type) is
   begin
      case L.Mode is
         when Sequential => 
            if L.Shadow_Sequential_Data_Loader /= null then
               Delete_MNIST_Data_Loader_Sequential_Sampler
                 (
                  L.Shadow_Sequential_Data_Loader
                 );
            end if;
         when Random => 
            if L.Shadow_Random_Data_Loader /= null then
               Delete_MNIST_Data_Loader_Default_Sampler
                 (
                  L.Shadow_Random_Data_Loader
                 );
            end if;
      end case;
   end;
   
   function Make_MNIST_Random_Data_Loader
     (
      Dataset : MNIST; 
      Batch_Size : Int64_T
     )
     return Data_Loader_Type is
      
      Err : aliased Ada_C_Error_Type;
      
   begin
      return Ret : Data_Loader_Type := 
        (
         Ada.Finalization.Limited_Controlled with 
         Mode => Random,
         Shadow_Random_Data_Loader => 
           -- Note the default sampler used, it is "random" as
           -- of the moment of writing (S.G.):
           New_MNIST_Data_Loader_Default_Sampler
             (
              Dataset.Shadow_Stacked_MNIST,
              Batch_Size,
              Err'Unchecked_Access
             )
        )
      do
         if Err.Has_Error then
            Put_Line (Standard_Error, 
                      "STDERR: function """ & Enclosing_Entity & 
                        """ raised exception " &
                        To_String (Err.Error_Message) &
                        " (code " & Err.Error_Code'Image & ")");
            Ada.Text_Io.Flush;
            raise PROGRAM_ERROR 
              with "ERROR, function """ & Enclosing_Entity &
                """ raised exception " &
                Trim_Torch_Error_Message (To_String (Err.Error_Message)) &
                " (code " & Err.Error_Code'Image & ")";
         end if;
      end return;
   end Make_MNIST_Random_Data_Loader;
   
   function Make_MNIST_Sequential_Data_Loader
     (
      Dataset : MNIST; 
      Batch_Size : Int64_T
     )
     return Data_Loader_Type is
      
      Err : aliased Ada_C_Error_Type;
      
   begin
      return Ret : Data_Loader_Type := 
        (
         Ada.Finalization.Limited_Controlled with 
         Mode => Sequential,
         Shadow_Sequential_Data_Loader => 
           New_MNIST_Data_Loader_Sequential_Sampler
             (
              Dataset.Shadow_Stacked_MNIST,
              Batch_Size,
              Err'Unchecked_Access
             )
        )
      do
         if Err.Has_Error then
            Put_Line (Standard_Error, 
                      "STDERR: function """ & Enclosing_Entity & 
                        """ raised exception " &
                        To_String (Err.Error_Message) &
                        " (code " & Err.Error_Code'Image & ")");
            Ada.Text_Io.Flush;
            raise PROGRAM_ERROR 
              with "ERROR, function """ & Enclosing_Entity &
                """ raised exception " &
                Trim_Torch_Error_Message (To_String (Err.Error_Message)) &
                " (code " & Err.Error_Code'Image & ")";
         end if;
      end return;
   end Make_MNIST_Sequential_Data_Loader;
   
   function Make_Mnist_Data_Loader
     (
      Dataset : MNIST; 
      Batch_Size : Int64_T;
      Mode : Data_Loader_Mode
     )
     return Data_Loader_Type is
      
      Err : aliased Ada_C_Error_Type;
      
   begin
      case Mode is
         when Sequential =>
            return Make_MNIST_Sequential_Data_Loader (Dataset, Batch_Size);
         when Random =>
            return Make_MNIST_Random_Data_Loader (Dataset, Batch_Size);
      end case;
   end;
   
   -- -------------------------------------------------------------------------
   -- Iterator infrastructure:
   
   -- Created and maintained on the C++ side:
   type Shadow_Data_Loader_Iterator_Type is
     null record;
   
   type Shadow_Data_Loader_Iterator_Access is 
     access Shadow_Data_Loader_Iterator_Type;
   
   type Data_Loader_Iterator_Type is
     new Data_Loader_Iterator_Interface.Forward_Iterator with
      record
         Cur_Batch : Batch_Cursor_Type;
         End_Batch : Batch_Cursor_Type;
      end record;
   
   overriding
   function First (Object : Data_Loader_Iterator_Type)
                  return Data_Loader_Iterator_Interface.Cursor;
   
   overriding
   function Next
     (
      Object : Data_Loader_Iterator_Type;
      Position : Data_Loader_Iterator_Interface.Cursor
     ) return Data_Loader_Iterator_Interface.Cursor;
   
   overriding
   function First (Object : Data_Loader_Iterator_Type)
                  return Data_Loader_Iterator_Interface.Cursor is
   begin
      pragma Debug (Put_Line ("Calling First"));
      return Data_Loader_Iterator_Interface.Cursor (Object.Cur_Batch);
   end;
   
   overriding
   function Next
     (
      Object : Data_Loader_Iterator_Type;
      Position : Data_Loader_Iterator_Interface.Cursor
     ) return Data_Loader_Iterator_Interface.Cursor is
   begin
      return Data_Loader_Iterator_Interface.Cursor (Position);
   end;
   
   -- Just for testing:
   Batch : aliased Batch_Type;
   
   function Batch_Reference
     (
      Loader   : aliased in out Data_Loader_Type;
      Position : in Batch_Cursor_Type
     ) return Batch_Reference_Type is
   begin
      return (Batch => Batch'Access);
   end;
   
   -- -------------------------------------------------------------------------
   
   function Iterate (D : Data_Loader_Type)
                    return Data_Loader_Iterator_Interface
                      .Forward_Iterator'Class is
      R : Data_Loader_Iterator_Type;
   begin
      return R;
   end;
   
   function Has_Element (Cursor : Batch_Cursor_Type) return Boolean is
   begin
      return False;
   end;
   
   function Make_Batch_Reference (Loader : aliased in out Data_Loader_Type)
                                 return Batch_Reference_Type is
      R : Batch_Reference_Type (null);
   begin
      return R;
   end;

end;
