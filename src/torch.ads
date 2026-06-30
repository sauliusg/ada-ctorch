with Ada.Finalization;
with Interfaces.C;

with Ada_C_Error_Codes; use Ada_C_Error_Codes;
with Torch_Element_Codes_H; use Torch_Element_Codes_H;

package Torch is
   
   -- NB:
   --
   --  Tensor assignment follows PyTorch semantics.
   --
   --  After
   --
   --      T2 := T1;
   --
   --  both tensors refer to the same underlying PyTorch tensor.
   --
   --  Use Clone if an independent copy is required.
   
   --
   --  Convenient subtype aliases:
   --

   -- subtype Int64_T  is Interfaces.C.long_long;
   -- subtype Int32_T  is Interfaces.C.int;
   subtype C_Float  is Interfaces.C.C_float;
   subtype C_Double is Interfaces.C.double;

   type UInt64_T is mod 2 ** 64;   
   
   type UInt8_T is mod 2 ** 8;
   for UInt8_T'Size use 8;
   
   subtype Int64_T is Long_Integer range -2**31 .. 2**31-1;
   
   type Int8_T is new Short_Integer range -128 .. 127;
   for Int8_T'Size use 8;
   
   type Integer_Array is array (Int64_T range <>) of Integer;
   
   type Int64_Array is array (Int64_T range <>) of aliased Int64_T
   with Convention => C;
   
   type Float_Array is array (Int64_T range <>) of aliased C_Float
   with Convention => C;
   
   --
   --  Array pointer helper types:
   --

   type Int64_Array_Access is access all Int64_T;

   pragma Convention (C, Int64_Array_Access);

   type Const_Int64_Array_Access is access constant Int64_T;

   pragma Convention (C, Const_Int64_Array_Access);

   type Float_Array_Access is access all C_Float;

   pragma Convention (C, Float_Array_Access);
   
   type Const_Float_Array_Access is access constant C_Float;

   pragma Convention (C, Const_Float_Array_Access);
   
   -- Specific Torch types;
   
   type Device_Index_Type is new Int8_T;
   
   -- -------------------------------------------------------------------------
   -- Tensor
   
   --
   -- The "official" Tensor interface:
   --
   
   type Tensor is tagged private;
   
   type Tensor_Element_Type is
     (
      Bool_Element,

      Int8_Element,
      UInt8_Element,

      Int16_Element,
      Int32_Element,
      Int64_Element,

      Float16_Element,
      BFloat16_Element,

      Float32_Element,
      Float64_Element,

      Complex32_Element,
      Complex64_Element,
      Complex128_Element
     );
   
   type Tensor_Number_Category is
     (
      Boolean_Category,
      Integer_Category,
      Floating_Point_Category,
      Complex_Category
     );
   
   -- Constructors:
   
   function Make_Random_Tensor (Dims : Int64_Array) return Tensor;
   
   -- Copy the Src C++ tensor to the Dst tensor. Uses the C++
   --  assignment operator on the C++ side under the hood:
   
   procedure Copy (Dst : in out Tensor; Src : in Tensor);
   
   -- Element accessor functions:
   
   function Element_Type (T : Tensor) return Tensor_Element_Type;
   
   function Category (Element_Type : Tensor_Element_Type)
                     return Tensor_Number_Category;
   
   function Is_Integer (Element_Type : Tensor_Element_Type)
                       return Boolean;

   function Is_Floating_Point (Element_Type : Tensor_Element_Type)
                              return Boolean;

   function Is_Complex (Element_Type : Tensor_Element_Type)
                       return Boolean;
   
   -- Tensor update and query functions imported from the C++ code:
   
   function Relu (X : Tensor) return Tensor;
   
   function View (Self : Tensor; Params : Int64_Array) return Tensor;
   
   function Max_Pool2d (X : Tensor; N : Int64_T) return Tensor;
   
   function Dropout (X : Tensor; P : Long_Float;
                     Is_Training : Boolean) return Tensor;
   
   function Log_Softmax (X : Tensor; Dim : Int64_T) return Tensor;
   
   function Nll_Loss (Output, Target : Tensor) return Tensor;
   
   function Nll_Loss_Sum (Output, Target : Tensor) return Tensor;
   
   function Nll_Loss_Sum (Output, Target : Tensor) return Float;
   
   function Size (T : Tensor; Dimension_Idx : Int64_T) return Int64_T;
   
   function Scalar (T : Tensor) return Float;
   
   function Scalar (T : Tensor) return Int64_T;
   
   function Is_NaN (T : Tensor) return Boolean;

   procedure Backward (T : Tensor);
   
   function Arg_Max (T : Tensor; Dimension_Idx : Int64_T) return Tensor;
   
   -- Returns Boolean Tensor indicating which elements were equal:
   function Eq (T1, T2 : Tensor) return Tensor;
   
   function Sum (T : Tensor) return Tensor;
   
   function Min (T : Tensor) return Tensor;
   
   function Max (T : Tensor) return Tensor;
   
   function Mean (T : Tensor) return Tensor;
   
   -- Accessor functions:
   
   function Dim (T : Tensor) return Int64_T;
   
   function Numel (T : Tensor) return Int64_T;
   
   function Stride (T : Tensor; Dim : Int64_T) return Int64_T;
   
   function Strides (T : Tensor) return Int64_Array;
   
   function Sizes (T : Tensor) return Int64_Array;
   
   function Is_Cuda (T : Tensor) return Boolean;
   
   function Is_Contigous (T : Tensor) return Boolean;
   
   function Get_Device (T : Tensor) return Device_Index_Type;
   
   -- Tensor element accessor functions:
   
   function Get_Int64 (Item : Tensor; Indices : Int64_Array)
                      return Int64_T;

   function Get_Float64 (Item : Tensor; Indices : Int64_Array)
                        return Long_Float;
   
   -- -------------------------------------------------------------------------
   
   type Vector_Of_Tensor_Type is private;
   
   -- -------------------------------------------------------------------------
   
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
   
   function Make_Device (Kind : Device_Kind_Type;
                         Idx : Device_Index_Type := -1)
                        return Device_Type;
   
   function To (X : in out Tensor'Class; D : Device_Type'Class) return Tensor;
   
   -- -------------------------------------------------------------------------
   
   type No_Grad_Guard is new Ada.Finalization.Limited_Controlled with private;
   
   overriding procedure Initialize (G : in out No_Grad_Guard);
   
   overriding procedure Finalize (G : in out No_Grad_Guard);
   
   -- -------------------------------------------------------------------------
   
   procedure Manual_Seed (Seed : UInt64_T)
   with Import => True,
     Convention => CPP,
     External_Name => "torch_manual_seed";
   
private
   
   --
   -- Opaque tensor handle:
   --
   
   -- Declared in full and managed on the C++ side:
   
   type Shadow_Tensor_Type is null record;
   
   type Shadow_Tensor_Access is access all Shadow_Tensor_Type;
   
   pragma Convention (CPP, Shadow_Tensor_Type);
   
   --
   -- The public Tensor implementation:
   --
   
   type Tensor is new Ada.Finalization.Controlled with record
      Shadow_Tensor : Shadow_Tensor_Access;
   end record;

   overriding
   procedure Initialize (M : in out Tensor);
   
   overriding
   procedure Adjust (M : in out Tensor);
   
   overriding
   procedure Finalize (M : in out Tensor);
   
   -- Copy the Src C++ tensor to the Dst tensor using the C++
   --  assignment operator on the C++ side:
   procedure Copy (Dst, Src : Shadow_Tensor_Access)
   with Import => True,
     Convention => CPP,
     External_Name => "tensor_copy";
   
   procedure Copy (Dst : in out Tensor; Src : Shadow_Tensor_Access);
   
   procedure Copy (Dst : Shadow_Tensor_Access; Src : in Tensor);
   
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
   
   function New_Tensor_Nll_Loss
     (
      Output : Shadow_Tensor_Access;
      Target : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Shadow_Tensor_Access
   with Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_nll_loss";
   
   function New_Tensor_Nll_Loss_Sum
     (
      Output : Shadow_Tensor_Access;
      Target : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Shadow_Tensor_Access
   with Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_nll_loss_sum";
   
   function Tensor_Nll_Loss_Sum_As_Float
     (
      Output : Shadow_Tensor_Access;
      Target : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Float
   with Import => True, 
     Convention => CPP, 
     External_Name => "tensor_nll_loss_sum_as_float";
   
   function Tensor_Size (T : Shadow_Tensor_Access;
                         Dimension_Idx : Int64_T;
                         Err : Ada_C_Error_Access)
                        return Int64_T
   with
     Import => True,
     Convention => CPP,
     External_Name => "tensor_size";
   
   function Tensor_Float_Item (S : Shadow_Tensor_Access;
                               Err : Ada_C_Error_Access)
                              return Float
   with
     Import => True,
     Convention => CPP,
     External_Name => "tensor_float_item";
   
   function Tensor_Int64_Item (S : Shadow_Tensor_Access;
                               Err : Ada_C_Error_Access)
                              return Int64_T
   with
     Import => True,
     Convention => CPP,
     External_Name => "tensor_int64_item";
   
   function Tensor_Is_Nan (S : Shadow_Tensor_Access;
                           Err : Ada_C_Error_Access)
                          return Int8_T
   with
     Import => True,
     Convention => CPP,
     External_Name => "tensor_is_nan";
   
   procedure Tensor_Backward (S : Shadow_Tensor_Access;
                              Err : Ada_C_Error_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "tensor_backward";
   
   function New_Tensor_Arg_Max (T : Shadow_Tensor_Access;
                                Dimension_Idx : Int64_T;
                                Err : Ada_C_Error_Access)
                               return Shadow_Tensor_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_tensor_arg_max";
   
   function New_Tensor_Eq
     (
      T1, T2 : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Shadow_Tensor_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_eq";
   
   function New_Tensor_Sum
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Shadow_Tensor_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_sum";
   
   function New_Tensor_Min
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Shadow_Tensor_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_min";
   
   function New_Tensor_Max
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Shadow_Tensor_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_max";
   
   function New_Tensor_Mean
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Shadow_Tensor_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_mean";
   
   function Tensor_Dim 
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Int64_T
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "tensor_dim";
   
   function Tensor_Numel
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Int64_T
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "tensor_numel";
   
   function Tensor_Stride
     (
      T : Shadow_Tensor_Access;
      Dim : Int64_T;
      E : Ada_C_Error_Access
     ) return Int64_T
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "tensor_stride";
   
   function Tensor_Is_Cuda
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Int8_T
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "tensor_is_cuda";
   
   function Tensor_Is_Contigous
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Int8_T
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "tensor_is_contiguous";
   
   function Tensor_Get_Device
     (
      T : Shadow_Tensor_Access;
      E : Ada_C_Error_Access
     ) return Int8_T
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "tensor_get_device";
   
   function New_Tensor_Rand (Dims : Const_Int64_Array_Access; Ndims : Int64_T)
                            return Shadow_Tensor_Access
   with
     Import => True, 
     Convention => CPP, 
     External_Name => "new_tensor_rand";
   
   -- Tensor element accessor functions:
   
   function Tensor_Get_Int64
     (Src     : Shadow_Tensor_Access;
      Indices : Const_Int64_Array_Access;
      Ndim    : Int64_T;
      Err     : Ada_C_Error_Access)
     return Int64_T
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "tensor_get_int64";

   function Tensor_Get_Float64
     (Src     : Shadow_Tensor_Access;
      Indices : Const_Int64_Array_Access;
      Ndim    : Int64_T;
      Err     : Ada_C_Error_Access)
     return C_Double
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "tensor_get_float64";
   
   -- -------------------------------------------------------------------------
   
   -- Declared and managed on the C++ side:
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
     External_Name => "delete_torch_device";
   
   procedure Shadow_Tensor_To_Device (Dst, Src : Shadow_Tensor_Access; 
                                      D : Shadow_Torch_Device_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "shadow_tensor_to_device";
   
   -- -------------------------------------------------------------------------
   
   -- Declared and maintained on the C++ side:
   type Shadow_No_Grad_Guard is null record;
   
   type Shadow_No_Grad_Guard_Access is access Shadow_No_Grad_Guard;
   
   type No_Grad_Guard is new Ada.Finalization.Limited_Controlled with 
      record
         Shadow_Guard : Shadow_No_Grad_Guard_Access;
      end record;
   
   function New_Shadow_No_Grad_Guard return Shadow_No_Grad_Guard_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_shadow_no_grad_guard";
   
   procedure Delete_Shadow_No_Grad_Guard (G : Shadow_No_Grad_Guard_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_shadow_no_grad_guard";
   
   function Tensor_Element_Type_Code
     (Src : Shadow_Tensor_Access;
      Err : Ada_C_Error_Access)
     return Torch_Element_Code
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "tensor_element_type_code";
   
   -- -------------------------------------------------------------------------
   
   -- Declared and controlled on the C++ side:
   type Shadow_Vector_Of_Tensor_Type is null record;
   
   type Shadow_Vector_Of_Tensor_Access is access Shadow_Vector_Of_Tensor_Type;
   
   function New_Vector_Of_Tensor (V : Shadow_Vector_Of_Tensor_Access)
                                 return Shadow_Vector_Of_Tensor_Access
   with
     Import => True,
     Convention => CPP,
     External_Name => "new_vector_of_tensor";
   
   procedure Delete_Vector_Of_Tensor (V : Shadow_Vector_Of_Tensor_Access)
   with
     Import => True,
     Convention => CPP,
     External_Name => "delete_vector_of_tensor";
   
   type Vector_Of_Tensor_Type is new Ada.Finalization.Controlled with
      record
         Shadow_Vector : Shadow_Vector_Of_Tensor_Access;
      end record;
   
   overriding
   procedure Finalize (V : in out Vector_Of_Tensor_Type);
   
   overriding
   procedure Adjust (V : in out Vector_Of_Tensor_Type);
   
end Torch;
