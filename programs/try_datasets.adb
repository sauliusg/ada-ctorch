with Torch.NN; -- need to satisfy C++ linker, provides Ada callback for C++
with Torch.Data.Datasets; use Torch.Data.Datasets;
with Ada.Command_Line; use Ada.Command_Line;

procedure Try_Layers is
   
   Root_Dir : String :=
     (if Argument_Count > 0 then Argument (1) else "data/");
   
   Plain_MNIST_Dataset : MNIST := Make_MNIST (Root_Dir);
   
   MNIST_Dataset : MNIST :=
     Make_Stacked_Normalised_MNIST (Root_Dir, 0.1307, 0.3081);
   
begin
   null;
end;
