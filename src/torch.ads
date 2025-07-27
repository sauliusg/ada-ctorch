package Torch is
   
   type UInt_64 is mod 2 ** 64;
   
   -- from /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/c10/core/DeviceType.h:
   type DeviceType is
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
   
   for DeviceType use
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
   
   for DeviceType'Size use 8;
   
   procedure Manual_Seed (Seed : UInt_64)
     with Import => True,
     Convention => CPP,
     External_Name => "torch_manual_seed";
   
private
   
   type Ada_Shadow_Tensor_Type is null record; -- Declared in full and managed on the C++ side
   
   type Ada_Shadow_Tensor_Access is access Ada_Shadow_Tensor_Type;
   
end Torch;
