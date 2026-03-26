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
   
   function Trim_Torch_Error_Message (M : String) return String is
      I, J : Integer;
   begin
      I := M'First;
      
      J := I;
      while J < M'Last and then M (J) /= ASCII.LF loop
         J := J + 1;
      end loop;
      
      if J <= M'Last and then M (J) = ASCII.LF then
         J := J - 1;
      end if;
      
      return M (I .. J) & '"';
   end;

end;
