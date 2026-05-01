with GNAT.Source_Info; use GNAT.Source_Info;

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
         Delete_Shadow_SGD_Options (SGD.Shadow_SGD_Options);
      end if;
   end;
   
   function Make_SGD_Options (Learning_Rate : Long_Float)
                             return SGD_Options_Type is
   begin
      return
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_SGD_Options => New_Shadow_SGD_Options (Double (Learning_Rate))
        );
   end;
   
   procedure Set_Momentum (SGD : in out SGD_Options_Type; Momentum : Long_Float) is
   begin
      if SGD.Shadow_SGD_Options /= null then
         Set_Momentum (SGD.Shadow_SGD_Options, Double (Momentum));
      else
         raise Program_Error with
           "Shadow object is null (not created?) when calling """ &
           Enclosing_Entity & """";
      end if;
   end;
   
   function Make_SGD_Options (Learning_Rate : Long_Float;
                              Momentum : Long_Float)
                             return SGD_Options_Type is
   begin
      return Ret : SGD_Options_Type := Make_SGD_Options (Learning_Rate)
      do
         Set_Momentum (Ret, Momentum);
      end return;
   end;
   
end;
