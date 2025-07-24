with Ada.Text_IO; use Ada.Text_IO;

procedure MNIST is
   
   type UInt_64 is mod 2 ** 64;
   
   procedure Manual_Seed (Seed : UInt_64)
     with Import => True,
     Convention => CPP,
     External_Name => "manual_seed";
   
begin
   Manual_Seed (1);
   Put_Line ("Random number generator initialised from Ada");
end;
