with Ada.Text_IO; use Ada.Text_IO;

with Torch;
with Torch.NN;
with Torch.Tensors;

procedure MNIST is
   
   Device : Torch.DeviceType := Torch.CPU;
   
   Net, Net2 : Torch.NN.Module;
   
   T1, T2 : Torch.Tensors.Tensor;
   
begin
   T1 := T2;
   Put_Line (Device'Size'Image);
   Torch.Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
end MNIST;
