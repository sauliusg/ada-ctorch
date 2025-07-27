with Ada.Finalization;

package Torch.Tensors is
   
   type Tensor is new Ada.Finalization.Controlled with private;
   
   overriding
   procedure Initialize (M : in out Tensor);
   
   overriding
   procedure Adjust (M : in out Tensor);
   
   overriding
   procedure Finalize (M : in out Tensor);
   
private
   
   type Tensor is new Ada.Finalization.Controlled with record
     Shadow_Tensor : Ada_Shadow_Tensor_Access;
   end record;

   function New_AdaShadowTensor return Ada_Shadow_Tensor_Access
     with Import => True,
     Convention => CPP,
     External_Name => "new_AdaShadowTensor";
   
   procedure Delete_AdaShadowTensor (ST : Ada_Shadow_Tensor_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "delete_AdaShadowTensor";
   
   procedure Inc_Refcount (T : Ada_Shadow_Tensor_Access)
     with Import => True,
     Convention => CPP,
     External_Name => "inc_tensor_refcount";
  
   function Dec_Refcount (T : Ada_Shadow_Tensor_Access) return Integer
     with Import => True,
     Convention => CPP,
     External_Name => "dec_tensor_refcount";
  
   function Get_Refcount (T : Ada_Shadow_Tensor_Access) return Integer
     with Import => True,
     Convention => CPP,
     External_Name => "get_tensor_refcount";
   
end Torch.Tensors;
