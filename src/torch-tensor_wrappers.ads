with Ada_C_Error_Codes; use Ada_C_Error_Codes;

package Torch.Tensor_Wrappers is
   
   -- Constructors:
   
   function Make_Tensor_From_Float_Array (Data : Float_Array) return Tensor;
   
   function Make_Tensor_From_Int64_Array (Data : Int64_Array) return Tensor;
   
   -- ChatGPT generated code:
   
   function Zeros (Dims : Int64_Array) return Tensor;

   function Ones (Dims : Int64_Array) return Tensor;

   function Empty (Dims : Int64_Array) return Tensor;

   function Random (Dims : Int64_Array) return Tensor;

   function Randn (Dims : Int64_Array) return Tensor;

   function Make_Tensor (Value : Int64_T) return Tensor;

   function Make_Tensor (Value : Long_Float) return Tensor;

   function Clone (Source : Tensor) return Tensor;

   function Reshape
     (Source : Tensor;
      Dims   : Int64_Array)
     return Tensor;

   function Zeros_Like (Source : Tensor) return Tensor;

   function Arange
     (Start : Int64_T;
      Stop  : Int64_T;
      Step  : Int64_T := 1)
     return Tensor;

   function Linspace
     (Start : Long_Float;
      Stop  : Long_Float;
      Steps : Int64_T)
     return Tensor;
   
private
   
   --
   --  1. zeros
   --

   function New_Tensor_Zeros
     (Dims : Const_Int64_Array_Access;
      Ndim : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_zeros";

   --
   --  2. ones
   --

   function New_Tensor_Ones
     (Dims : Const_Int64_Array_Access;
      Ndim : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_ones";

   --
   --  3. empty
   --

   function New_Tensor_Empty
     (Dims : Const_Int64_Array_Access;
      Ndim : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_empty";

   --
   --  4. rand
   --

   function New_Tensor_Random
     (Dims : Const_Int64_Array_Access;
      Ndim : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_random";

   --
   --  5. randn
   --

   function New_Tensor_Randn
     (Dims : Const_Int64_Array_Access;
      Ndim : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_randn";

   --
   --  6. scalar int64 tensor
   --

   function New_Tensor_Int64
     (Value : Int64_T;
      Err   : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_int64";

   --
   --  6b. scalar double precision float tensor
   --

   function New_Tensor_Float64
     (Value : C_Double;
      Err   : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_float64";

   --
   --  7. tensor from float array
   --

   function New_Tensor_From_Float_Array
     (Data : Const_Float_Array_Access;
      Len  : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_from_float_array";

   --
   --  7b. tensor from float array
   --

   function New_Tensor_From_Int64_Array
     (Data : Const_Int64_Array_Access;
      Len  : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_from_int64_array";

   --
   --  8. clone
   --

   function Tensor_Clone
     (Src : Shadow_Tensor_Access;
      Err : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "tensor_clone";

   --
   --  9. reshape
   --

   function Tensor_Reshape
     (Src  : Shadow_Tensor_Access;
      Dims : Const_Int64_Array_Access;
      Ndim : Int64_T;
      Err  : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "tensor_reshape";

   --
   --  10. zeros_like
   --

   function Tensor_Zeros_Like
     (Src : Shadow_Tensor_Access;
      Err : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "tensor_zeros_like";

   --
   --  11. arange
   --

   function New_Tensor_Arange
     (Start : Int64_T;
      Stop  : Int64_T;
      Step  : Int64_T;
      Err   : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_arange";

   --
   --  12. linspace
   --

   function New_Tensor_Linspace
     (Start : C_Double;
      Stop  : C_Double;
      Steps : Int64_T;
      Err   : Ada_C_Error_Access)
      return Shadow_Tensor_Access
   with
     Import        => True,
     Convention    => CPP,
     External_Name => "new_tensor_linspace";

end Torch.Tensor_Wrappers;
