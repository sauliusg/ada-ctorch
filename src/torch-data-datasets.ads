with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with Ada.Finalization;

package Torch.Data.Datasets is
   
   type MNIST is new Ada.Finalization.Limited_Controlled with private;

   overriding
   procedure Finalize (C : in out MNIST);
   
   function Make_MNIST (Dir_Name : String) return MNIST;
   
private
   
   -- declared in full and managed on the C++ side:
   type Shadow_MNIST_Type is null record;
   
   type Shadow_MNIST_Access is access Shadow_MNIST_Type;
   
   type MNIST is new Ada.Finalization.Limited_Controlled with record
      Shadow_MNIST : Shadow_MNIST_Access;
   end record;
   
   function New_Mnist_Dataset (Dir_Name : Chars_Ptr) return Shadow_MNIST_Access
   with Import => True,
     Convention => CPP,
     External_Name => "new_mnist_dataset";
   
   procedure Delete_Mnist_Dataset (SC : Shadow_MNIST_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "delete_mnist_dataset";
   
end;
