with Ada.Finalization;

package Torch.Rng_Init is
   
   type Rng_Initializer (Seed : Uint64_T) is new Ada.Finalization.Controlled
     with null record;
   
   overriding procedure Initialize (R : in out Rng_Initializer);
   
end;
