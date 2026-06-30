pragma Ada_2022;

with Ada.Text_Io; use Ada.Text_Io;

with Torch; use Torch;
with Torch.NN; use Torch.NN; -- Needed at the moment to link with 'call_ada_forward_method'.

with Torch.Tensor_Wrappers; use Torch.Tensor_Wrappers;

with Torch.Tensor_Io; use Torch.Tensor_Io;

with GNAT.Source_Info;

procedure Try_Loss is
   
   function Entity return String renames GNAT.Source_Info.Enclosing_Entity;
   
begin
   Put_Line ("This is """ & Entity & """");
   
   Torch.Manual_Seed (1);
   
   declare
      TD : Tensor := Make_Tensor_From_Int64_Array ((101, 124, 131, 399));
      TL : Tensor := Make_Tensor_From_Int64_Array ((100, 120, 132, 400));
      Loss : Tensor;
   begin
      Put_Line ("TD Dimensions: " & TD.Dim'Image);
      Put (TD);
      New_Line;
      
      Put_Line ("TL Dimensions: " & TL.Dim'Image);
      Put (TL);
      New_Line;
      
      declare
         Loss : Tensor := Torch.Nll_Loss (TD, TL);
      begin
         Put_Line ("Loss Dimensions: " & Loss.Dim'Image);
         Put (Loss);
         New_Line;
      end;
   end;
   
end;
