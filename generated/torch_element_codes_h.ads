pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_intn_h;

package torch_element_codes_h is

   subtype Torch_Element_Code is x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- ../src/cpp/torch_element_codes.h:12

   subtype Torch_Element_Code_Enum is int;
   Torch_Element_Code_Enum_TORCH_ELEMENT_INVALID : constant Torch_Element_Code_Enum := -1;
   Torch_Element_Code_Enum_TORCH_ELEMENT_BOOL : constant Torch_Element_Code_Enum := 0;
   Torch_Element_Code_Enum_TORCH_ELEMENT_INT8 : constant Torch_Element_Code_Enum := 1;
   Torch_Element_Code_Enum_TORCH_ELEMENT_UINT8 : constant Torch_Element_Code_Enum := 2;
   Torch_Element_Code_Enum_TORCH_ELEMENT_INT16 : constant Torch_Element_Code_Enum := 3;
   Torch_Element_Code_Enum_TORCH_ELEMENT_INT32 : constant Torch_Element_Code_Enum := 4;
   Torch_Element_Code_Enum_TORCH_ELEMENT_INT64 : constant Torch_Element_Code_Enum := 5;
   Torch_Element_Code_Enum_TORCH_ELEMENT_FLOAT16 : constant Torch_Element_Code_Enum := 6;
   Torch_Element_Code_Enum_TORCH_ELEMENT_BFLOAT16 : constant Torch_Element_Code_Enum := 7;
   Torch_Element_Code_Enum_TORCH_ELEMENT_FLOAT32 : constant Torch_Element_Code_Enum := 8;
   Torch_Element_Code_Enum_TORCH_ELEMENT_FLOAT64 : constant Torch_Element_Code_Enum := 9;
   Torch_Element_Code_Enum_TORCH_ELEMENT_COMPLEX32 : constant Torch_Element_Code_Enum := 10;
   Torch_Element_Code_Enum_TORCH_ELEMENT_COMPLEX64 : constant Torch_Element_Code_Enum := 11;
   Torch_Element_Code_Enum_TORCH_ELEMENT_COMPLEX128 : constant Torch_Element_Code_Enum := 12;  -- ../src/cpp/torch_element_codes.h:41

end torch_element_codes_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
