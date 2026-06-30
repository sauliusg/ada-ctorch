pragma Ada_2022;

with Ada.Text_Io; use Ada.Text_Io;

with Torch; use Torch;
with Torch.NN; use Torch.NN; -- Needed at the moment to link with 'call_ada_forward_method'.

with Torch.Tensor_Wrappers; use Torch.Tensor_Wrappers;

with Torch.Tensor_Io; use Torch.Tensor_Io;

with GNAT.Source_Info;

procedure Try_Scalars is
   
   function Entity return String renames GNAT.Source_Info.Enclosing_Entity;
   
   SF : Tensor := Make_Tensor (3.14);
   SI : Tensor := Make_Tensor (42);
   
begin
   Put_Line ("This is """ & Entity & """");
   
   Put_Line ("SF Dimensions: " & SF.Dim'Image);
   Put (SF);
   New_Line;
   
   Put_Line ("SI Dimensions: " & SI.Dim'Image);
   Put (SI);
   New_Line;   
end;
