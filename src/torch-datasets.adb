with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.Source_Info; use GNAT.Source_Info;

package body Torch.Datasets is
   
   overriding
   procedure Finalize (C : in out MNIST) is
   begin
      case C.Kind is
         when Plain =>
            if C.Shadow_MNIST /= null then
               Delete_MNIST_Dataset (C.Shadow_MNIST);
            end if;
         when Normalised =>
            if C.Shadow_Normalised_MNIST /= null then
               Delete_MNIST_Normaliser (C.Shadow_Normalised_MNIST);
            end if;
         when Stacked =>
            if C.Shadow_Stacked_MNIST /= null then
               Delete_MNIST_Stack (C.Shadow_Stacked_MNIST);
            end if;
      end case;
   end;
   
   function Make_MNIST (Dir_Name : String;
                        Mode : Mnist_Dataset_Mode := Train) return Mnist is
      Dir_Name_Chars : aliased Char_Array := To_C (Dir_Name);
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Mnist :=
        (
         Ada.Finalization.Limited_Controlled with
         Kind => Plain,
         Shadow_Mnist =>
           New_MNIST_Dataset (To_Chars_Ptr (Dir_Name_Chars'Unchecked_Access),
                              MNIST_Dataset_Mode'Pos (Mode),
                              Err'Unchecked_Access)
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
   
   function Make_Normalised_MNIST (M : MNIST; X, Y : Long_Float) 
                                  return MNIST is
      subtype Double is Interfaces.C.double;
   begin
      return
        (
         Ada.Finalization.Limited_Controlled with
         Kind => Normalised,
         Shadow_Normalised_Mnist =>
           New_Mnist_Normaliser (M.Shadow_MNIST, Double (X), Double (Y))
        );
   end;
   
   function Make_Stacked_MNIST (M : MNIST) return Mnist is
   begin
      return
        (
         Ada.Finalization.Limited_Controlled with
         Kind => Stacked,
         Shadow_Stacked_Mnist =>
           New_Mnist_Stack (M.Shadow_Normalised_MNIST)
        );      
   end;
   
   function Make_Stacked_Normalised_MNIST (M : Mnist; X, Y : Long_Float) 
                                          return Mnist is
   begin
      return Make_Stacked_MNIST (Make_Normalised_MNIST (M, X, Y));
   end;
   
   function Make_Stacked_Normalised_MNIST (Dir : String; X, Y : Long_Float)
                                          return Mnist is
   begin
      return Make_Stacked_Normalised_MNIST (Make_MNIST (Dir), X, Y);
   end;
   
   function Size (M : MNIST) return Uint64_T is
   begin
      case M.Kind is
         when Plain =>
            return Mnist_Dataset_Size (M.Shadow_MNIST);
         when Normalised =>
            return Mnist_Dataset_Size (M.Shadow_Normalised_MNIST);
         when Stacked =>
            return Mnist_Dataset_Size (M.Shadow_Stacked_MNIST);
      end case;
   end;

end;
