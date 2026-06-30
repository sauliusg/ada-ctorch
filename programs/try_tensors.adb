pragma Ada_2022;

with Ada.Text_Io; use Ada.Text_Io;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Torch; use Torch;
with Torch.NN; use Torch.NN; -- Needed at the moment to link with 'call_ada_forward_method'.
with Torch.Tensor_Io; use Torch.Tensor_Io;

procedure Try_Tensors is
   
   function Display (S : String) return String is
      R : String := S;
   begin
      for C of R loop
         if C = ASCII.CR or else C = ASCII.LF then
            C := ' ';
         end if;
      end loop;
      return Trim (R, Side => Both);
   end;
   
   T1 : Tensor := Make_Random_Tensor ((2, 3, 4));
   
begin
   Put_Line (Display (Sizes   (T1)'Image));
   Put_Line (Display (Strides (T1)'Image));
   Put (T1);
   New_Line;
end;
