package body Torch.Data.Datasets is
   
   overriding
   procedure Finalize (C : in out MNIST) is
   begin
      case C.Kind is
         when Plain =>
            if C.Shadow_MNIST /= null then
               Delete_Mnist_Dataset (C.Shadow_MNIST);
            end if;
         when Normalised =>
            if C.Shadow_Normalised_MNIST /= null then
               Delete_Mnist_Normaliser (C.Shadow_Normalised_MNIST);
            end if;
         when Stacked =>
            if C.Shadow_Stacked_MNIST /= null then
               Delete_Mnist_Stack (C.Shadow_Stacked_MNIST);
            end if;
      end case;
   end;
   
   function Make_MNIST (Dir_Name : String) return MNIST is
      Dir_Name_Chars : aliased Char_Array := To_C (Dir_Name);
   begin
      return
        (
         Ada.Finalization.Limited_Controlled with
         Kind => Plain,
         Shadow_Mnist =>
           New_Mnist_Dataset (To_Chars_Ptr (Dir_Name_Chars'Unchecked_Access))
        );
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
   
   function Make_Stacked_MNIST (M : Mnist; X, Y : Long_Float) return Mnist is
   begin
      return Make_Stacked_Mnist (Make_Normalised_Mnist (M, X, Y));
   end;

end;
