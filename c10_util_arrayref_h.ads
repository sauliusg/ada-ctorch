pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package c10_util_ArrayRef_h is

   package ArrayRef_long is
      type ArrayRef is limited record
         null;
      end record
      with Convention => C_Pass_By_Copy

   end;
   use ArrayRef_long;



   subtype IntArrayRef is ArrayRef;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/c10/util/ArrayRef.h:378

   subtype IntList is ArrayRef;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/c10/util/ArrayRef.h:382

end c10_util_ArrayRef_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
