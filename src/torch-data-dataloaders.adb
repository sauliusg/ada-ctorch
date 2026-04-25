with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.Source_Info; use GNAT.Source_Info;

package body Torch.Data.Dataloaders is
   
   overriding
   procedure Finalize (L : in out Data_Loader_Type) is
   begin
      if L.Shadow_Data_Loader /= null then
         Delete_MNIST_Data_Loader_Sequential_Sampler (L.Shadow_Data_Loader);
      end if;
   end;
   
   function Make_MNIST_Data_Loader (Dataset : MNIST; Batch_Size : Int64_T)
                                   return Data_Loader_Type is
            Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Data_Loader_Type := 
        (
         Ada.Finalization.Limited_Controlled with 
         Shadow_Data_Loader => 
           New_MNIST_Data_Loader_Sequential_Sampler
             (
              Dataset, Batch_Size,
              Err'Unchecked_Access
             )
        ) do
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
   end;
   
end;
