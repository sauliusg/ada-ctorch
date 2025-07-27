with Torch.Tensors; use Torch.Tensors;

package body Torch.NN is

   overriding procedure Initialize (M : in out Module) is
   begin
      -- We promise that the M'Access pointer will only be used by the
      --  C-side functions while the object on the Ada side
      --  exists. This will be ensured by makein the Ada own the
      --  allocated C++ object that holds the Ada object reference, to
      --  never let that reference to outside, and to let the
      --  Initilaize and Finalize handle the shared pointers. We will
      --  also make the Ada Module type limited so that no bitwise
      --  copy of the type can occur. Thus, we exepect the use of
      --  'Unchecked_Access to be safe:
      
      M.Shadow_Module := New_AdaShadowModule (M'Unchecked_Access);
      
      if M.Shadow_Module = null then
         raise STORAGE_ERROR with "C++ side could not allocate PyTorch module for Ada";
      end if;
   end;

   overriding procedure Finalize (M : in out Module) is
   begin
      Delete_AdaShadowModule (M.Shadow_Module);
   end;
   
   function Call_Ada_Forward_Method
     (
      M : Module_Access;
      T : Ada_Shadow_Tensor_Type
     ) return Ada_Shadow_Tensor_Type
   is
   begin
      return T;
   end;
   
end;
