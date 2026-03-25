with Torch.NN; -- need to satisfy C++ linker, provides Ada callback for C++
with Torch.Data.Datasets; use Torch.Data.Datasets;

procedure Try_Layers is
   
   MNIST_Dataset : MNIST :=
     Make_Stacked_Normalised_MNIST ("data/", 0.1307, 0.3081);
   
begin
   null;
end;
