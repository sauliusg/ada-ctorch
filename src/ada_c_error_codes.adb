package body Ada_C_Error_Codes is
   
   procedure Ada_Set_Error_Code (E : Ada_C_Error_Access; Code : Interfaces.C.int) is
   begin
      if E /= null then
         E.Has_Error := True;
         E.Error_Code := Integer (Code);
      end if;
   end;
   
   procedure Ada_Set_Error_Message (E : Ada_C_Error_Access; Message : chars_ptr) is
   begin
      if E /= null then
         E.Has_Error := True;
         E.Error_Message := To_Unbounded_String (Value (Message));
      end if;
   end;

end;
