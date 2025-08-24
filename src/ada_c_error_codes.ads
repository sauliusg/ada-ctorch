with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

package Ada_C_Error_Codes is
   
   type Ada_C_Error_Type is record
      Has_Error     : Boolean := False;
      Error_Code    : Integer := 0;
      Error_Message : Unbounded_String;
   end record;
   
   type Ada_C_Error_Access is access all Ada_C_Error_Type;
   
   procedure Ada_Set_Error_Code (E : Ada_C_Error_Access; Code : Interfaces.C.int)
     with 
     Export => True,
     Convention => CPP,
     External_Name => "ada_set_error_code";
   
   procedure Ada_Set_Error_Message (E : Ada_C_Error_Access; Message : chars_ptr)
     with 
     Export => True,
     Convention => CPP,
     External_Name => "ada_set_error_message";
   
end;
