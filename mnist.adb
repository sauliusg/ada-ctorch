with Ada.Text_IO; use Ada.Text_IO;

with Torch;
with Torch.NN;

procedure MNIST is
   
   Device : Torch.DeviceType := Torch.CPU;
   
begin
   Put_Line (Device'Size'Image);
   Torch.Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
end MNIST;
