with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.Source_Info; use GNAT.Source_Info;

package body Torch.Datasets is
   
   procedure New_Ada_Shadow_Stacked_Dataset (D : Ada_Shadow_Dataset_Access;
                                             E : Ada_C_Error_Access)
   with 
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_stacked_dataset";
   
   function Ada_Shadow_Stacked_Dataset_Size (D : Ada_Shadow_Dataset_Access;
                                             E : Ada_C_Error_Access)
                                            return Uint64_T
   with 
     Import => True,
     Convention => CPP,
     External_Name => "ada_shadow_dataset_size";
   
   overriding
   procedure Finalize (C : in out Dataset) is
   begin
      Delete_Ada_Shadow_Dataset (C.Shadow_Dataset);
   end;
   
   function Size (M : Dataset) return Uint64_T is
   begin
      return Ada_Shadow_Dataset_Size (M.Shadow_Dataset);
   end;

end;
