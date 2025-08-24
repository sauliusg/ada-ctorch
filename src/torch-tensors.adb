with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

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
   
   procedure Ensure_Unaliased (T : in out Tensor) is
   begin
      if Refcount (T.Shadow_Tensor) > 1 then
         declare
            Dummy : Integer := Dec_Refcount (T.Shadow_Tensor);
         begin
            Allocate (T);
         end;
      end if;
   end;
   
   -- The Copy procedure uses the C++ side assignemt operator to copy
   --  the underlying tensors, but not the reference counts:
   procedure Copy (Dst, Src : in out Tensor) is
   begin
      -- Implement copy-on-write:
      Ensure_Unaliased (Dst);
      Copy (Dst.Shadow_Tensor, Src.Shadow_Tensor);
   end;
   
   procedure Copy (Dst : in out Tensor; Src : Shadow_Tensor_Access) is
   begin
      -- Implement copy-on-write:
      Ensure_Unaliased (Dst);
      Copy (Dst.Shadow_Tensor, Src);
   end;
   
   procedure Copy (Dst : Shadow_Tensor_Access; Src : in Tensor) is
   begin
      -- Simply copy the tensor data to the C++ side, assuming that
      --  the C++ torch::Tensor operator = will handle everything
      --  correctly:
      Copy (Dst, Src.Shadow_Tensor);
   end;
   
   function Relu (X : Tensor) return Tensor is
      Ret : Tensor;
      Err : aliased Ada_C_Error_Type;
   begin
      Tensor_Relu (Ret.Shadow_Tensor, X.Shadow_Tensor, Err'Unchecked_Access);
      if Err.Has_Error then
         raise PROGRAM_ERROR with "ERROR, function ""Relu"" raised exception: " &
           To_String (Err.Error_Message) & "(code " & Err.Error_Code'Image & ")";
      end if;
      return Ret;
   end;
   
end Torch.Tensors;
