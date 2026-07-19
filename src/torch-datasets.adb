with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Interfaces.C;
with GNAT.Source_Info; use GNAT.Source_Info;

with Ada_C_Error_Codes; use Ada_C_Error_Codes;

package body Torch.Datasets is
   
   procedure Delete_Ada_Shadow_Dataset (D : Ada_Shadow_Dataset_Access;
                                        E : Ada_C_Error_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_ada_shadow_dataset";
   
   overriding
   procedure Finalize (C : in out Dataset) is
      Err : aliased Ada_C_Error_Type;
   begin
      Delete_Ada_Shadow_Dataset (C.Shadow_Dataset, Err'Unchecked_Access);
      Check_Error (Err);
   end;
   
   function Ada_Shadow_Dataset_Size (D : Ada_Shadow_Dataset_Access;
                                     E : Ada_C_Error_Access)
                                    return Uint64_T
   with 
     Import => True,
     Convention => CPP,
     External_Name => "ada_shadow_dataset_size";
   
   function Size (M : Dataset) return Uint64_T is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Uint64_T :=
        Ada_Shadow_Dataset_Size (M.Shadow_Dataset, Err'Unchecked_Access)
      do
         Check_Error (Err);
      end return;
   end;

   function New_Ada_Shadow_Stacked_Dataset (D : Ada_Shadow_Dataset_Access;
                                            E : Ada_C_Error_Access)
                                           return Ada_Shadow_Dataset_Access
   with 
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_stacked_dataset";
   
   function Make_Stacked (D : Dataset) return Dataset is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Dataset :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Dataset =>
           New_Ada_Shadow_Stacked_Dataset
             (
              D.Shadow_Dataset,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;   
   
   function New_Ada_Shadow_Normalised_Dataset (D : Ada_Shadow_Dataset_Access;
                                               X, Y : Interfaces.C.Double;
                                               E : Ada_C_Error_Access)
                                              return Ada_Shadow_Dataset_Access
   with 
     Import => True,
     Convention => CPP,
     External_Name => "new_ada_shadow_normalised_dataset";
   
   function Make_Normalised (D : Dataset; X, Y : Long_Float) return Dataset is
      subtype Double is Interfaces.C.double;
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Dataset :=
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Dataset =>
           New_Ada_Shadow_Normalised_Dataset
             (
              D.Shadow_Dataset,
              Double (X), Double (Y),
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err);
      end return;
   end;
   
end;
