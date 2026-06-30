with Torch;

package body Torch.Rng_Init is
   
   overriding procedure Initialize (R : in out Rng_Initializer) is
   begin
      Torch.Manual_Seed (R.Seed);
   end;
   
end;
