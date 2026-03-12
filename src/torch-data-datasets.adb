package body Torch.Data.Datasets is
   
   overriding
   procedure Finalize (C : in out MNIST) is
   begin
      if C.Shadow_MNIST /= null then
         Delete_Mnist_Dataset (C.Shadow_MNIST);
      end if;
   end;
   
   function Make_MNIST (Dir_Name : String) return MNIST is
      Dir_Name_Chars : aliased Char_Array := To_C (Dir_Name);
   begin
      return
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Mnist =>
           New_Mnist_Dataset (To_Chars_Ptr (Dir_Name_Chars'Unchecked_Access))
        );
   end;
   
end;
