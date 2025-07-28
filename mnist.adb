with Ada.Text_IO; use Ada.Text_IO;

with Torch;
with Torch.NN;
with Torch.Tensors; use Torch.Tensors;

procedure MNIST is
   
   Device : Torch.DeviceType := Torch.CPU;
   
   Net, Net2 : Torch.NN.Module;
   
   T1, T2 : Torch.Tensors.Tensor;
   
   X1, X2, X3 : Torch.Tensors.Tensor;
   
begin
   T1 := T2;
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T2)));
   
   Copy (X2, T2);
   Copy (T1, X1);
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T2)));
   
   Put_Line ("X1 Refcount: " & Integer'Image (Torch.Tensors.Refcount (X1)));
   Put_Line ("X2 Refcount: " & Integer'Image (Torch.Tensors.Refcount (X2)));
   
   Put_Line (Device'Size'Image);
   Torch.Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
end MNIST;
