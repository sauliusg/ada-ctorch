with Ada.Finalization;

package Torch.Tensors is
   
   type Tensor is new Ada.Finalization.Controlled with private;
   
   overriding
   procedure Initialize (M : in out Tensor);
   
   overriding
   procedure Adjust (M : in out Tensor);
   
   overriding
   procedure Finalize (M : in out Tensor);
   
   type Shadow_Tensor_Type is limited private;
   
   type Shadow_Tensor_Access is access Shadow_Tensor_Type;
   
   function Refcount (M : Tensor) return Integer;

   -- Copy the Src C++ tensor to the Dst tensor using the C++
   --  assignment operator on the C++ side:
   procedure Copy (Dst, Src : Shadow_Tensor_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "tensor_copy";
   
   procedure Copy (Dst, Src : in out Tensor);
   
private
   
   type Shadow_Tensor_Type is null record; -- Declared in full and managed on the C++ side
   
   type Tensor is new Ada.Finalization.Controlled with record
     Shadow_Tensor : Shadow_Tensor_Access;
   end record;

   function New_AdaShadowTensor return Shadow_Tensor_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowTensor";
   
   procedure Delete_AdaShadowTensor (ST : Shadow_Tensor_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_AdaShadowTensor";
   
   procedure Inc_Refcount (T : Shadow_Tensor_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "inc_tensor_refcount";
  
   function Dec_Refcount (T : Shadow_Tensor_Access) return Integer
     with Import => True,
     Convention => CPP,
     External_Name => "dec_tensor_refcount";
  
   function Get_Refcount (T : Shadow_Tensor_Access) return Integer
     with Import => True,
     Convention => CPP,
     External_Name => "get_tensor_refcount";
   
   function Refcount (M : Shadow_Tensor_Access) return Integer
     with Import => True,
     Convention => CPP,
     External_Name => "get_tensor_refcount";   
   
end Torch.Tensors;
