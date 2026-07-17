pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_intn_h;

package ada_dataloader_codes_h is

   subtype Ada_DataLoader_Code is x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- ../src/cpp/ada_dataloader_codes.h:14

   subtype Ada_DataLoader_Code_Enum is int;
   Ada_DataLoader_Code_Enum_ADA_DATALOADER_INVALID : constant Ada_DataLoader_Code_Enum := -1;
   Ada_DataLoader_Code_Enum_ADA_DATALOADER_SEQUENTIAL : constant Ada_DataLoader_Code_Enum := 0;
   Ada_DataLoader_Code_Enum_ADA_DATALOADER_RANDOM : constant Ada_DataLoader_Code_Enum := 1;  -- ../src/cpp/ada_dataloader_codes.h:30

end ada_dataloader_codes_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
