with Ada.Text_IO;
with Ada.Float_Text_IO;

-- with Torch.Tensors;
with Torch; use Torch;

package Torch.Tensor_IO is

   procedure Put
     (Item : in Torch.Tensor;
      Fore : in Ada.Text_IO.Field := 0;
      Aft  : in Ada.Text_IO.Field := Ada.Float_Text_IO.Default_Aft;
      Exp  : in Ada.Text_IO.Field := Ada.Float_Text_IO.Default_Exp);

end Torch.Tensor_IO;
