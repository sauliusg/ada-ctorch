with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

with Ada.Finalization;

package Torch.Datasets is
   
   type Dataset_Mode is (Train, Test);
   
   for Dataset_Mode use (Train => 0, Test => 1);
   for Dataset_Mode'Size use 8;
   
   type Dataset is tagged limited private;
   
   function Make_Normalised (D : Dataset; X, Y : Long_Float) return Dataset;
   
   function Make_Stacked (D : Dataset) return Dataset;
   
   function Size (M : Dataset) return UInt64_T;
   
private
   
   -- =========================================================================
   -- Dataset (C++ side):  
   
   -- declared in full and managed on the C++ side:
   type Ada_Shadow_Dataset_Type is null record;
   
   type Ada_Shadow_Dataset_Access is access Ada_Shadow_Dataset_Type;
   
   -- =========================================================================
   -- Dataset (Ada side):
   
   type Dataset is new Ada.Finalization.Limited_Controlled with
      record
         Shadow_Dataset : Ada_Shadow_Dataset_Access;
      end record;

   overriding
   procedure Finalize (C : in out Dataset);
   
end;
