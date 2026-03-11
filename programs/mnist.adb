with Ada.Text_IO; use Ada.Text_IO;

with Torch; use Torch;
with Torch.NN; use Torch.NN;

procedure MNIST is
   
   Device : Torch.DeviceType := Torch.CPU;
   
   type Net_Type is new Torch.NN.Module with record
      Conv1   : Torch.NN.Conv2d := Make_Conv2d (1,  10, Kernel_Size => 5);
      Conv2   : Torch.NN.Conv2d := Make_Conv2d (10, 20, Kernel_Size => 5);
      Dropout : Torch.NN.Dropout2d;
      Fc1     : Torch.NN.Linear := Make_Linear (320, 50);
      Fc2     : Torch.NN.Linear := Make_Linear (50, 10);
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
      N.Register_Module ("Conv1", N.Conv1);
      N.Register_Module ("Conv2", N.Conv2);
      N.Register_Module ("Drop", N.Dropout);
      N.Register_Module ("Fc1", N.Fc1);
      N.Register_Module ("Fc2", N.Fc2);
   end;
   
   overriding
   function Forward (Self : in out Net_Type; X : Tensor) return Tensor is
      Y : Tensor;
   begin
      Put_Line (">>> Calling 'Forward' from Net_Type of 'mnist'.");
      Y := Torch.Relu (Max_Pool2d (Self.Conv1.Forward (Y), 2));
      Y := Torch.Relu (Max_Pool2d (Self.Dropout.Forward 
                                     (Self.Conv2.Forward (Y)), 2));
      Y := Y.View ((-1, 320));
      Y := Torch.Relu (Self.Fc1.Forward (Y));
      Y := Torch.Dropout (Y, 0.5, Is_Training => Self.Is_Training);
      Y := Self.Fc2.Forward (Y);
      return Torch.Log_Softmax (Y, Dim => 1);
   end;
   
   Net : Torch.NN.Module;
   
   Net1 : Net_Type;
   
   T1, T2 : Torch.Tensor;
   
   X1, X2, X3 : Torch.Tensor;
   
begin
   T1 := T2;
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Refcount (T2)));
   
   Copy (X2, T2);
   Copy (T1, X1);
   
   -- T1 := Net1.Forward (T1); -- This raises exception in C++, forwarded to Ada.
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Refcount (T2)));
   
   Put_Line ("X1 Refcount: " & Integer'Image (Torch.Refcount (X1)));
   Put_Line ("X2 Refcount: " & Integer'Image (Torch.Refcount (X2)));
   
   Put_Line (Device'Size'Image);
   Torch.Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
end MNIST;
