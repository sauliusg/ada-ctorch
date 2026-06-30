pragma Ada_2022;

with Ada.Text_Io; use Ada.Text_Io;

with Torch; use Torch;
with Torch.NN; use Torch.NN; -- Needed at the moment to link with 'call_ada_forward_method'.

with Torch.Tensor_Wrappers; use Torch.Tensor_Wrappers;

with Torch.Tensor_Io; use Torch.Tensor_Io;

with GNAT.Source_Info;

procedure Try_More_Tensors is
   
   function Entity return String renames GNAT.Source_Info.Enclosing_Entity;
   
   T1 : Tensor := Make_Random_Tensor ((1 => 5));
   T2 : Tensor := Make_Random_Tensor ((4, 7));
   T3 : Tensor := Make_Random_Tensor ((2, 3, 4));
   T4 : Tensor := Make_Random_Tensor ((2, 3, 4, 5));
   
   TF : Tensor := Make_Tensor_From_Float_Array ((100.1, 120.4, 132.9));
   TI : Tensor := Make_Tensor_From_Int64_Array ((100, 120, 132, 400));
   
begin
   Put_Line ("This is """ & Entity & """");
   
   Put_Line ("T1 Dimensions: " & T1.Dim'Image);
   Put (T1);
   New_Line;
   
   Put_Line ("T2 Dimensions: " & T2.Dim'Image);
   Put (T2);
   New_Line;
   
   Put_Line ("T3 Dimensions: " & T3.Dim'Image);
   Put (T3);
   New_Line;
   
   Put_Line ("T4 Dimensions: " & T4.Dim'Image);
   Put (T4);
   New_Line;
   
   Put_Line ("TF Dimensions: " & TF.Dim'Image);
   Put (TF);
   New_Line;
   
   Put_Line ("TI Dimensions: " & TI.Dim'Image);
   Put (TI);
   New_Line;
end;
