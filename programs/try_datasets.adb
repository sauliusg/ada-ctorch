with Ada.Text_Io; use Ada.Text_Io;

with Torch; use Torch; -- for UInt64_T
with Torch.NN; -- need to satisfy C++ linker, provides Ada callback for C++
with Torch.Datasets; use Torch.Datasets;
with Ada.Command_Line; use Ada.Command_Line;

procedure Try_Datasets is
   
   Root_Dir : String :=
     (if Argument_Count > 0 then Argument (1) else "data/");
   
   Plain_MNIST_Dataset : MNIST := Make_MNIST (Root_Dir);
   
   Normalised_MNIST_Dataset : MNIST :=
     Make_Normalised_MNIST (Plain_MNIST_Dataset, 0.1307, 0.3081);
   
   Stacked_MNIST_Dataset : MNIST :=
     Make_Stacked_Normalised_MNIST (Root_Dir, 0.1307, 0.3081);
   
   Plain_DS_Size : UInt64_T := Size (Plain_MNIST_Dataset);
   
   Normalised_DS_Size : UInt64_T := Size (Normalised_MNIST_Dataset);
   
   Stacked_DS_Size : UInt64_T := Size (Stacked_MNIST_Dataset);
   
   Test_MNIST_Dataset : MNIST := Make_MNIST (Root_Dir, Mode => Test);
   
   Test_MNIST_Normalised_DS :
     MNIST := Make_Stacked_Normalised_MNIST (
                                           Make_MNIST (Root_Dir, Mode => Test),
                                           0.1307, 0.3081
                                          );
   
begin
   Put_Line ("Plain_MNIST_Dataset size       = " & Plain_DS_Size'Image);
   Put_Line ("Normalised_MNIST_Dataset size  = " & Normalised_DS_Size'Image);
   Put_Line ("Stacked_MNIST_Dataset size     = " & Stacked_DS_Size'Image);
   New_Line;
   Put_Line ("Test MNIST dataset size        = " &
               Size (Test_MNIST_Dataset)'Image);
   Put_Line ("Test MNIST dataset size (norm) = " &
               Size (Test_MNIST_Normalised_DS)'Image);
end;
