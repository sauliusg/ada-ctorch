package body Ada_C_Error_Codes is
   
   procedure Set_Error_Code (E : Ada_C_Error_Access; Code : Interfaces.C.int) is
   begin
      if E /= null then
         E.Has_Error := True;
         E.Error_Code := Integer (Code);
      end if;
   end;
   
end;
