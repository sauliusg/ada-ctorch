package body Torch.Optim is
   
   overriding
   procedure Finalize (SGD : in out SGD_Type) is
   begin
      null;
   end;
   
   -- -------------------------------------------------------------------------
   
   overriding
   procedure Finalize (SGD : in out SGD_Options_Type) is
   begin
      if SGD.Shadow_SGD_Options /= null then
         Delete_Shadow_SGD_Options (Sgd.Shadow_SGD_Options);
      end if;
   end;
   
   function Make_SDG_Options (X : Long_Float) return SGD_Options_Type is
      subtype Double is Interfaces.C.double;
   begin
      return
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_SGD_Options => New_Shadow_SGD_Options (Double (X))
        );
   end;

end;
