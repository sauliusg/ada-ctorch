with Ada.Finalization;

with Ada_C_Error_Codes; use Ada_C_Error_Codes;

package Torch is
   
   type UInt64_T is mod 2 ** 64;   
   
   type UInt8_T is mod 2 ** 8;
   for UInt8_T'Size use 8;
   
   subtype Int64_T is Long_Integer range -2**31 .. 2**31-1;
   
   type Int8_T is new Short_Integer range -128 .. 127;
   for Int8_T'Size use 8;
   
   type Integer_Array is array (Int64_T range <>) of Integer;
   type Int64_Array is array (Int64_T range <>) of Int64_T;
   
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
   
   procedure Copy (Dst : in out Tensor; Src : Shadow_Tensor_Access);
   
   procedure Copy (Dst : Shadow_Tensor_Access; Src : in Tensor);
   
   -- Tensor update functions impoerted from the C++ code:
   
   function Relu (X : Tensor) return Tensor;
   
   function View (Self : Tensor; Params : Int64_Array) return Tensor;
   
   function Max_Pool2d (X : Tensor; N : Int64_T) return Tensor;
   
   function Dropout (X : Tensor; P : Long_Float;
                     Is_Training : Boolean) return Tensor;
      
   function Log_Softmax (X : Tensor; Dim : Int64_T) return Tensor;
   
   -- from /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/c10/core/DeviceType.h:
   type Device_Kind_Type is
     (
      CPU,
      CUDA,
      MKLDNN, -- Reserved for explicit MKLDNN
      OPENGL,
      OPENCL,
      IDEEP,
      HIP,    -- AMD HIP
      FPGA,
      MAIA,
      XLA,
      Vulkan,
      Metal,
      XPU,
      MPS,
      Meta,   -- Meta (tensors with no data)
      HPU,    -- HPU / HABANA
      VE,     -- SX-Aurora / NEC
      Lazy,   -- Lazy Tensors
      IPU,    -- Graphcore IPU
      MTIA,   -- Meta training and inference devices
      PrivateUse1,
      COMPILE_TIME_MAX_DEVICE_TYPES
     );
   
   for Device_Kind_Type use
     (
      CPU    => 0,
      CUDA   => 1,  -- CUDA.
      MKLDNN => 2,  -- Reserved for explicit MKLDNN
      OPENGL => 3,  -- OpenGL
      OPENCL => 4,  -- OpenCL
      IDEEP  => 5,  -- IDEEP.
      HIP    => 6,  -- AMD HIP
      FPGA   => 7,  -- FPGA
      MAIA   => 8,  -- ONNX Runtime / Microsoft
      XLA    => 9,  -- XLA / TPU
      Vulkan => 10, -- Vulkan
      Metal  => 11, -- Metal
      XPU    => 12, -- XPU
      MPS    => 13, -- MPS
      Meta   => 14, -- Meta (tensors with no data)
      HPU    => 15, -- HPU / HABANA
      VE     => 16, -- SX-Aurora / NEC
      Lazy   => 17, -- Lazy Tensors
      IPU    => 18, -- Graphcore IPU
      MTIA   => 19, -- Meta training and inference devices
      PrivateUse1 => 20, -- PrivateUse1 device
      -- NB: If you add more devices:
      --  - Change the implementations of DeviceTypeName and isValidDeviceType
      --    in DeviceType.cpp
      --  - Change the number below
      COMPILE_TIME_MAX_DEVICE_TYPES => 21
     );
   
   for Device_Kind_Type'Size use 8;
   
   -- -------------------------------------------------------------------------
   
   type Device_Type is new Ada.Finalization.Limited_Controlled with private;
   
   overriding
   procedure Finalize (D : in out Device_Type);
   
   -- -------------------------------------------------------------------------
   
   procedure Manual_Seed (Seed : UInt64_T)
     with Import => True,
     Convention => CPP,
     External_Name => "torch_manual_seed";
   
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
   
   procedure Tensor_Relu
     (
      Retval : Shadow_Tensor_Access;
      X : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     )
     with Import => True, 
     Convention => CPP, 
     External_Name => "tensor_relu";
   
   procedure Tensor_View
     (
      Retval : Shadow_Tensor_Access;
      X      : Shadow_Tensor_Access;
      Params : Int64_Array;
      NParam : Int64_T;
      E      : Ada_C_Error_Access      
     )
     with Import => True, 
     Convention => CPP, 
     External_Name => "tensor_view";
   
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
   
   procedure Tensor_Dropout
     (
      Retval : Shadow_Tensor_Access;
      X : Shadow_Tensor_Access;
      P : Long_Float;
      T : UInt8_T;                     -- Is_Training ?
      E : Ada_C_Error_Access
     )
     with Import => True, 
     Convention => CPP, 
     External_Name => "tensor_dropout";
   
   procedure Tensor_Log_Softmax
     (
      Retval : Shadow_Tensor_Access;
      X : Shadow_Tensor_Access;
      D : Int64_T;
      E : Ada_C_Error_Access
     )
   with Import => True, 
     Convention => CPP, 
     External_Name => "tensor_log_softmax";
   
   -- -------------------------------------------------------------------------
   
   -- Declared anad managed on the C++ side:
   type Shadow_Torch_Device_Type is null record;
   
   type Shadow_Torch_Device_Access is access Shadow_Torch_Device_Type;
   
   type Device_Type is new Ada.Finalization.Limited_Controlled with record
      Shadow_Device : Shadow_Torch_Device_Access;
   end record;
   
   function New_Torch_Shadow_Device (K : Device_Kind_Type; Idx : Int8_T := -1)
                                    return Shadow_Torch_Device_Access
   with Import => True,
     Convention => CPP,
     External_Name => "new_torch_device";
   
   procedure Delete_Torch_Shadow_Device (D : Shadow_Torch_Device_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "new_torch_device";
   
end Torch;
