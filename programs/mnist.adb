with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Torch; use Torch;
with Torch.NN; use Torch.NN;

with Torch.Data.Datasets; use Torch.Data.Datasets;
with Torch.Data.Datasets.Loaders; use Torch.Data.Datasets.Loaders;

with Torch.Optim; use Torch.Optim;

with Ada.Command_Line; use Ada.Command_Line;

procedure MNIST is
   
   Number_Of_Epochs : constant Long_Integer := 10;   
   Log_Interval     : constant Long_Integer := 10;
   
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
      Y : Tensor := X;
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
   
   Train_Dataset_Size : UInt64_T := Size (Train_MNIST_Dataset);
   Test_Dataset_Size  : UInt64_T := Size (Test_MNIST_Dataset);   
   
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
      Model  : in out Net_Type;
      Device : Device_Type;
      Loader : Data_Loader_Type;
      Optimiser    : in out Torch.Optim.SGD_Type;
      Dataset_Size : UInt64_T
     )
   is
      Batch_Idx : Long_Integer := 0;
   begin
      Model.Train;
      for Batch of Loader loop
         Batch_Idx := Batch_Idx + 1;
         declare
            Data   : Tensor := Batch.Data;
            Target : Tensor := Batch.Target;
            Output : Tensor;
            Loss   : Tensor;
         begin
            Data.To   (Device);
            Target.To (Device);
            Optimiser.Zero_Grad;
            Output := Model.Forward (Data);
            Loss   := Torch.Nll_Loss (Output, Target);
            
            if Is_Nan (Loss) then
               raise Program_Error with 
                 "invalid (Nan?) values found in the Loss tensor";
            end if;
            
            Loss.Backward;
            Optimiser.Step;
            
            if Batch_Idx mod Log_Interval = 0 then
               Put
                 (
                  "Train Epoch: " & Epoch'Image & ", " &
                    "Batch: " & Batch_Idx'Image & ", " &
                    "Data: " & '[' & 
                    Trim (Long_Integer'Image
                            (Batch_Idx * Long_Integer (Size (Data, 0))),
                          Side => Ada.Strings.Both) &
                    '/' &
                    Trim (UInt64_T'Image (Dataset_Size),
                          Side => Ada.Strings.Both) &
                    ']' & ", " &
                    "Loss: "
                 );
               Put (Scalar (Loss), 1, 6, 0);
               Put (ASCII.CR);
            end if;
         end;
      end loop;
      New_Line;
   end;
   
   procedure Test
     (
      Model  : in out Net_Type;
      Device : Device_Type;
      Loader : Data_Loader_Type;
      Dataset_Size : UInt64_T
     )
   is
      Test_Loss : Long_Float := 0.0;
      Corrent   : Integer := 0;
   begin
      Model.Eval;
      for Batch of Loader loop
         declare
            Data   : Tensor := Batch.Data;
            Target : Tensor := Batch.Target;
            Output : Tensor;
            Predicted : Tensor;
         begin
            Data.To   (Device);
            Target.To (Device);
            Output := Model.Forward (Data);
            Test_Loss := Test_Loss + 
              Long_Float (Scalar (Torch.Nll_Loss_Sum (Output, Target)));
            Predicted := Output.Arg_Max (1);
         end;
      end loop;
   end;
   
begin
   T1 := T2;
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Refcount (T2)));
   
   Copy (X2, T2);
   Copy (T1, X1);
   
   -- T1 := Net.Forward (T1); -- This raises exception in C++, forwarded to Ada.
   
   Put_Line ("T1 Refcount: " & Integer'Image (Torch.Refcount (T1)));
   Put_Line ("T2 Refcount: " & Integer'Image (Torch.Refcount (T2)));
   
   Put_Line ("X1 Refcount: " & Integer'Image (Torch.Refcount (X1)));
   Put_Line ("X2 Refcount: " & Integer'Image (Torch.Refcount (X2)));
   
   Put_Line (Device_Kind'Size'Image);
   Put_Line (Device'Size'Image);
   
   Torch.Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
   
   declare
      Step : Integer := 0;
   begin
      for Batch of Train_Loader loop
         Step := Step + 1;
         if Step mod 100 = 0 then
            Put_Line ("Step: " & Step'Image);
         end if;
      end loop;
      Put_Line ("Total steps: " & Step'Image);
   end;
   
   Put_Line (80 * "-");
   
   declare
      Step : Integer := 0;
   begin
      for Batch of Train_Loader loop
         Step := Step + 1;
         if Step mod 100 = 0 then
            Put_Line ("Step: " & Step'Image);
         end if;
      end loop;
      Put_Line ("Total steps: " & Step'Image);
   end;
   
   Put_Line (80 * "=");
   
   declare
      Step : Integer := 0;
   begin
      for Batch of Test_Loader loop
         Step := Step + 1;
         if Step mod 2 = 0 then
            Put_Line ("Step: " & Step'Image);
         end if;
      end loop;
      Put_Line ("Total steps: " & Step'Image);
   end;
   
   for Epoch in 1 .. Number_Of_Epochs loop
      Train (Epoch, Net, Device, Train_Loader, Optimiser, Train_Dataset_Size);
      Test  (Net, Device, Test_Loader, Test_Dataset_Size);
   end loop;
   
end MNIST;
