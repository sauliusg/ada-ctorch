package body Tensors is
   
   -- Tensors are shared during Ada variable assignments and implement
   --  copy-on-write – the C++ side shadow tensor should be cloned if
   --  Ada wants to modify it and the tensor is shared.
   
   overriding
   procedure Initialize (M : in out Tensor) is
   begin
      M.Shadow_Tensor := New_AdaShadowTensor;
      
      if M.Shadow_Tensor = null then
         raise STORAGE_ERROR with
           "coulr not allocate memry for a PyTorch shadow tensor";
      end if;
   end;
   
   overriding
   procedure Adjust (M : in out Tensor) is
   begin
      Inc_Refcount (M.Shadow_Tensor);
   end;
   
   overriding
   procedure Finalize (M : in out Tensor) is
   begin
      if Dec_Refcount (M.Shadow_Tensor) = 0 then
         Delete_AdaShadowTensor (M.Shadow_Tensor);
      end if;
   end;
   
end Tensors;
