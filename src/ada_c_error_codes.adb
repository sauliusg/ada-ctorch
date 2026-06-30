with Ada.Text_Io; use Ada.Text_Io;

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

   -- Error handling helper:
   
   procedure Check_Error (Err : Ada_C_Error_Type;
                          Entity_Name : String := Enclosing_Entity) is
   begin
      if Err.Has_Error then
         Put_Line (Standard_Error, 
                   "STDERR: function """ & Entity_Name &
                     """ raised exception " &
                     To_String (Err.Error_Message) &
                     " (code " & Err.Error_Code'Image & ")");
         Ada.Text_Io.Flush;
         raise PROGRAM_ERROR 
           with "ERROR, function """ & Entity_Name &
           """ raised exception " &
           To_String (Err.Error_Message) &
           " (code " & Err.Error_Code'Image & ")";         
      end if;
   end;
   
end;
