with Torch.NN; use Torch.NN;

procedure Try_Layers is
   
   Options1    : Conv1d_Options; 
   Options2    : Conv1d_Options := Make_Conv1d_Options (120, 200, 10);
   
   Conv_Layer  : Conv1d;   
   Conv_Layer2 : Conv1d := Make_Conv1d (10, 20, 5);
   Conv_Layer3 : Conv1d :=  Make_Conv1d (Make_Conv1d_Options (100, 200, 50));
   
begin
   null;
end;
