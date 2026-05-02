with Ada.Text_IO; use Ada.Text_IO;

with Torch; use Torch;
with Torch.NN; use Torch.NN;

with Torch.Data.Datasets; use Torch.Data.Datasets;
with Torch.Data.Datasets.Loaders; use Torch.Data.Datasets.Loaders;

with Torch.Optim; use Torch.Optim;

with Ada.Command_Line; use Ada.Command_Line;

procedure MNIST is
   
   Device_Kind : Torch.Device_Kind_Type := Torch.CPU;
   
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
      pragma Debug (Put_Line (">> Initialising Net_Type"));
      Initialize (Torch.NN.Module (N));
      pragma Debug (Put_Line (">> Registering convolutional layers"));
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
      pragma Debug (Put_Line (">>> Calling 'Forward' from Net_Type of " &
                                "'mnist'."));
      Y := Torch.Relu (Max_Pool2d (Self.Conv1.Forward (Y), 2));
      Y := Torch.Relu (Max_Pool2d (Self.Dropout.Forward 
                                     (Self.Conv2.Forward (Y)), 2));
      Y := Y.View ((-1, 320));
      Y := Torch.Relu (Self.Fc1.Forward (Y));
      Y := Torch.Dropout (Y, 0.5, Is_Training => Self.Is_Training);
      Y := Self.Fc2.Forward (Y);
      return Torch.Log_Softmax (Y, Dim => 1);
   end;
   
   Net : Net_Type;
   
   T1, T2 : Torch.Tensor;
   
   X1, X2, X3 : Torch.Tensor;
   
   Root_Dir : constant String :=
     (if Argument_Count > 0 then Argument (1) else "data/");
   
   Train_Mnist_Dataset :  Torch.Data.Datasets.Mnist :=
     Make_Stacked_Normalised_MNIST (
                                    Make_MNIST (Root_Dir, Mode => Train),
                                    0.1307, 0.3081
                                   );
   
   Test_MNIST_Dataset : Torch.Data.Datasets.MNIST := 
     Make_Stacked_Normalised_MNIST (
                                    Make_MNIST (Root_Dir, Mode => Test),
                                    0.1307, 0.3081
                                   );
   
   Train_Batch_Size : constant Int64_T := 64;
   Test_Batch_Size  : constant Int64_T := 1000;
   
   Train_Loader : Data_Loader_Type :=
     Make_Mnist_Data_Loader
       (
        Train_MNIST_Dataset,
        Train_Batch_Size,
        Mode => Sequential
       );
   
   Test_Loader : Data_Loader_Type :=
     Make_Mnist_Data_Loader
       (
        Test_MNIST_Dataset,
        Test_Batch_Size,
        Mode => Random
       );
   
   Device : Device_Type := Make_Device (Device_Kind);
   
   Optimiser : Torch.Optim.SGD_Type :=
     Make_SGD_Optimiser (Net.Parameters,
                         Make_SGD_Options
                           (
                            Learning_Rate => 0.01,
                            Momentum      => 0.5
                           )
                        );
   
   procedure Train
     (
      Epoch  : Long_Integer;
      Model  : Net_Type;
      Device : Device_Type;
      Loader : Data_Loader_Type;
      Optimiser    : Torch.Optim.SGD_Type;
      Dataset_Size : Long_Integer
     )
   is
   begin
      for Batch of Loader loop
         null;
      end loop;
   end;
   
   procedure Test
     (
      Model  : Net_Type;
      Device : Device_Type;
      Loader : Data_Loader_Type;
      Dataset_Size : Long_Integer
     )
   is
   begin
      null;
   end;
   
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
   
   Put_Line (Device_Kind'Size'Image);
   Put_Line (Device'Size'Image);
   
   Torch.Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
   
   declare
      Step : Integer := 1;
   begin
      for Batch of Train_Loader loop
         if Step mod 100 = 0 then
            Put_Line ("Step: " & Step'Image);
         end if;
         Step := Step + 1;
      end loop;
      Put_Line ("Total steps: " & Step'Image);
   end;
   
end MNIST;
