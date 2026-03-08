with Ada.Finalization;

with Ada_C_Error_Codes; use Ada_C_Error_Codes;

package Torch.Tensors is
   
   type Tensor is new Ada.Finalization.Controlled with private;
   
   subtype Int64_T is Long_Integer range -2**31 .. 2**31-1;
   
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
   
   procedure Copy (Dst : in out Tensor; Src : Shadow_Tensor_Access);
   
   procedure Copy (Dst : Shadow_Tensor_Access; Src : in Tensor);
   
   -- Tensor update functions impoerted from the C++ code:
   
   function Relu (X : Tensor) return Tensor;
   
   function Max_Pool2d (X : Tensor; N : Int64_T) return Tensor;
   
   -- ----- 

   -- Make public for now so that the "Forward" method in Torch.NN can
   -- pass it to the C++ side. Will have to think how to hide it from
   -- external users (S.G.):
   
   function Get_Shadow (T : Tensor) return Shadow_Tensor_Access;
   
   -- The problem here is that the Shadow_Tensor_Access which is
   -- returned lives only as long as the Tensor variable itself, and
   -- we do not want to upt the burden of traceing this on the users
   -- of the Tensor and the Module types.
   
private
   
   type Shadow_Tensor_Type is null record; -- Declared in full and managed on the C++ side
   
   type Tensor is new Ada.Finalization.Controlled with record
     Shadow_Tensor : Shadow_Tensor_Access;
   end record;

   function Get_Shadow (T : Tensor) return Shadow_Tensor_Access is
     (T.Shadow_Tensor);
   
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
   
   procedure Tensor_Relu
     (
      Retval : Shadow_Tensor_Access;
      X : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     )
     with Import => True, 
     Convention => CPP, 
     External_Name => "tensor_relu";
   
   procedure Tensor_Max_Pool2d
     (
      Retval : Shadow_Tensor_Access;
      X : Shadow_Tensor_Access;
      N : Int64_T;
      E : Ada_C_Error_Access
     )
     with Import => True, 
     Convention => CPP, 
     External_Name => "tensor_max_pool2d";
   
end Torch.Tensors;
