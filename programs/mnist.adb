with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Long_Float_Text_IO; use Ada.Long_Float_Text_IO;
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
   
   function Display (I : Int64_T) return String is
   begin
      return Trim (I'Image, Side => Ada.Strings.Both);
   end;
   
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
      Batch_Idx : Int64_T := 0;
   begin
      Model.Train;
      for Batch of Loader loop
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
                    Display ((Batch_Idx + 1) * Int64_T (Batch.Data.Size (0))) &
                    '/' &
                    Display (Int64_T (Dataset_Size)) &
                    ']' & ", " &
                    "Loss: "
                 );
               Put (Scalar (Loss), 1, 6, 0);
               Put (ASCII.CR);
            end if;
         end;
         Batch_Idx := Batch_Idx + 1;
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
      Correct   : Int64_T := 0;
   begin
      Model.Eval;
      for Batch of Loader loop
         declare
            Data   : Tensor := Batch.Data;
            Target : Tensor := Batch.Target;
            Output : Tensor;
            Predicted : Tensor;
            Curr_Loss : Float;
         begin
            Data.To   (Device);
            Target.To (Device);
            Output := Model.Forward (Data);
            Curr_Loss := Scalar (Torch.Nll_Loss_Sum (Output, Target));
            Test_Loss := Test_Loss + Long_Float (Curr_Loss);
            Predicted := Output.Arg_Max (1);
            Correct := Correct + Scalar (Predicted.Eq (Target).Sum);
         end;
      end loop;
      Test_Loss := Test_Loss / Long_Float (Dataset_Size);            
      Put ("Test set: Average loss: ");
      Put (Test_Loss, 1, 4, 0);
      Put (" | Accuracy: ");
      Put (Correct'Image & '/');
      Put (Dataset_Size'Image & ' ');
      Put (Long_Float (Correct) / Long_Float (Dataset_Size), 1, 4, 0);
      New_Line;
   end;
   
begin
   
   Torch.Manual_Seed (1);
   
   for Epoch in 1 .. Number_Of_Epochs loop
      Train (Epoch, Net, Device, Train_Loader, Optimiser, Train_Dataset_Size);
      Test  (Net, Device, Test_Loader, Test_Dataset_Size);
   end loop;
   
end MNIST;
