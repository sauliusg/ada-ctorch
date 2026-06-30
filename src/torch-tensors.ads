package Torch.Tensors is
   pragma Preelaborate;

   type Tensor is limited private;

   -------------------------------------------------------------------
   -- Construction
   -------------------------------------------------------------------

   function Zeros   (Shape : Int64_Array) return Tensor;
   function Ones    (Shape : Int64_Array) return Tensor;
   function Randn   (Shape : Int64_Array) return Tensor;

   function Scalar_Int64 (Value : Int64) return Tensor;
   function From_Float_Array (Data : Float_Array) return Tensor;

   -------------------------------------------------------------------
   -- Copy / clone (explicit deep copy only)
   -------------------------------------------------------------------

   function Clone (T : Tensor) return Tensor;

   -------------------------------------------------------------------
   -- Arithmetic (functional: returns new tensors)
   -------------------------------------------------------------------

   function "+" (A, B : Tensor) return Tensor;
   function "-" (A, B : Tensor) return Tensor;
   function "*" (A, B : Tensor) return Tensor;

   function MatMul (A, B : Tensor) return Tensor;

   -------------------------------------------------------------------
   -- Activations (functional)
   -------------------------------------------------------------------

   function Relu (T : Tensor) return Tensor;
   function Log_Softmax (T : Tensor; Dim : Integer) return Tensor;

   -------------------------------------------------------------------
   -- Loss
   -------------------------------------------------------------------

   function NLL_Loss (Input, Target : Tensor) return Tensor;

   -------------------------------------------------------------------
   -- In-place operations (mutation boundary)
   -------------------------------------------------------------------

   procedure Add_Inplace (A : in out Tensor; B : Tensor);
   procedure Mul_Inplace (A : in out Tensor; B : Tensor);
   procedure Zero (A : in out Tensor);

   -------------------------------------------------------------------
   -- Structural ops (views, reshapes)
   -------------------------------------------------------------------

   function View   (T : Tensor; Shape : Int64_Array) return Tensor;
   function Reshape(T : Tensor; Shape : Int64_Array) return Tensor;

   -------------------------------------------------------------------
   -- Device transfer
   -------------------------------------------------------------------

   procedure To_CPU    (T : in out Tensor);
   procedure To_CUDA   (T : in out Tensor);

   -------------------------------------------------------------------
   -- Introspection (debug + IO)
   -------------------------------------------------------------------

   function Dim   (T : Tensor) return Natural;
   function Size  (T : Tensor; D : Positive) return Int64;
   function Sizes (T : Tensor) return Int64_Array;

   function Element_Count (T : Tensor) return Int64;

   -------------------------------------------------------------------
   -- Element access (slow path only)
   -------------------------------------------------------------------

   function Get_Int64 (T : Tensor; Index : Int64_Array) return Int64;
   function Get_Float64 (T : Tensor; Index : Int64_Array) return Long_Float;

   -------------------------------------------------------------------
   -- IO
   -------------------------------------------------------------------

   procedure Put
     (T   : Tensor;
      Fore : Natural := 1;
      Aft  : Natural := 6;
      Exp  : Natural := 0);

private

   -------------------------------------------------------------------
   -- Opaque handle to C++ TensorCore
   -------------------------------------------------------------------

   type Tensor_Rep;
   type Tensor_Rep_Access is access all Tensor_Rep;

   type Tensor is limited record
      Impl : Tensor_Rep_Access;
   end record;

   -------------------------------------------------------------------
   -- Lifecycle (C++ managed allocation)
   -------------------------------------------------------------------

   procedure Free (T : in out Tensor);

end Torch.Tensors;
