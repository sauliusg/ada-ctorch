with Torch.NN; use Torch.NN;

procedure Try_Conv2d is
   
   C2d : Conv2d; -- := Make_Conv2d (120, 200, 10);
   
   Options  : Conv2d_Options; -- := Make_Conv2d_Options (120, 200, 10);
   Options2 : Conv2d_Options := Make_Conv2d_Options (120, 200, 10);
   
   C2d_With_Options : Conv2d :=
     Make_Conv2d (10, 20, 5);
   
   C2d_With_Options2 : Conv2d := 
     Make_Conv2d (Make_Conv2d_Options (100, 200, 50));
   
begin
   null;
end;
