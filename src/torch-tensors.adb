package body Torch.Tensors is
   
   -- Tensors are shared during Ada variable assignments and implement
   --  copy-on-write – the C++ side shadow tensor should be cloned if
   --  Ada wants to modify it and the tensor is shared.
   
   procedure Allocate (M : in out Tensor) is
   begin
      M.Shadow_Tensor := New_AdaShadowTensor;
      
      if M.Shadow_Tensor = null then
         raise STORAGE_ERROR with
           "could not allocate memory for a PyTorch shadow tensor";
      end if;
   end;
   
   overriding
   procedure Initialize (M : in out Tensor) is
   begin
      Allocate (M);
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
   
   function Refcount (M : Tensor) return Integer is
   begin
      return Refcount (M.Shadow_Tensor);
   end;
     
   -- The Copy procedure uses the C++ side assignemt operator to copy
   --  the underlying tensors, but not the reference counts:
   procedure Copy (Dst, Src : in out Tensor) is
   begin
      -- Implement copy-on-write:
      if Refcount (Dst.Shadow_Tensor) > 1 then
         declare
            Dummy : Integer := Dec_Refcount (Dst.Shadow_Tensor);
         begin
            Allocate (Dst);
         end;
      end if;
      Copy (Dst.Shadow_Tensor, Src.Shadow_Tensor);
   end;
   
end Torch.Tensors;
