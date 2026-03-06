with Ada.Text_IO; use Ada.Text_IO;

with Torch;
with Torch.NN; use Torch.NN;
with Torch.Tensors; use Torch.Tensors;

procedure MNIST is
   
   Device : Torch.DeviceType := Torch.CPU;
   
   type Net_Type is new Torch.NN.Module with record
      Conv1 : Torch.NN.Conv2d := Make_Conv2d (1,  10, Kernel_Size => 5);
      Conv2 : Torch.NN.Conv2d := Make_Conv2d (10, 20, Kernel_Size => 5);
      Dropout : Torch.NN.Dropout2d;
      Fc1 : Torch.NN.Linear := Make_Linear (320, 50);
      Fc2 : Torch.NN.Linear := Make_Linear (50, 10);
   end record;
   
   overriding
   procedure Initialize (N : in out Net_Type);
      
   overriding
   function Forward (Self : in out Net_Type; X : Tensor) return Tensor;
   
   overriding procedure Initialize (N : in out Net_Type) is
   begin
      Put_Line (">> Initialising Net_Type");
      Initialize (Torch.NN.Module (N));
      Put_Line (">> Registering a convolutional layers");
      Register_Module (N, "Conv1", N.Conv1);
      Register_Module (N, "Conv2", N.Conv2);
      Register_Module (N, "Drop", N.Dropout);
      Register_Module (N, "Fc1", N.Fc1);
      Register_Module (N, "Fc2", N.Fc2);
   end;
   
   overriding
   function Forward (Self : in out Net_Type; X : Tensor) return Tensor is
   begin
      Put_Line (">>> Calling 'Forward' from Net_Type of 'mnist'.");
      return Torch.Tensors.Relu (X);
   end;
   
   Net : Torch.NN.Module;
   
   Net1 : Net_Type;
   
   T1, T2 : Torch.Tensors.Tensor;
   
   X1, X2, X3 : Torch.Tensors.Tensor;
   
begin
   T1 := T2;
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T2)));
   
   Copy (X2, T2);
   Copy (T1, X1);
   
   -- T1 := Net1.Forward (T1); -- This raises exception in C++, forwarded to Ada.
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Tensors.Refcount (T2)));
   
   Put_Line ("X1 Refcount: " & Integer'Image (Torch.Tensors.Refcount (X1)));
   Put_Line ("X2 Refcount: " & Integer'Image (Torch.Tensors.Refcount (X2)));
   
   Put_Line (Device'Size'Image);
   Torch.Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
end MNIST;
