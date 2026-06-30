with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Torch.Tensor_Wrappers; use Torch.Tensor_Wrappers;
with Torch_Element_Codes_H; use Torch_Element_Codes_H;

with GNAT.Source_Info; use GNAT.Source_Info;

package body Torch is
   
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
      Previous : Shadow_Tensor_Access := M.Shadow_Tensor;
   begin
      Allocate (M);
      Copy (M, Previous);
   end;
   
   overriding
   procedure Finalize (M : in out Tensor) is
   begin
      Delete_AdaShadowTensor (M.Shadow_Tensor);
   end;
   
   -- Tensor constructors:
   
   function Make_Random_Tensor (Dims : Int64_Array) return Tensor is
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           New_Tensor_Rand
             (
              Dims (Dims'First)'Unchecked_Access,
              Int64_T (Dims'Length)
             )
        )      
      do
         if Ret.Shadow_Tensor = null then
            raise Storage_Error with "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end;
   
   -- The Copy procedure uses the C++ side assignemt operator to copy
   --  the underlying tensors, but not the reference counts:
   procedure Copy (Dst : in out Tensor; Src : in Tensor) is
   begin
      Copy (Dst.Shadow_Tensor, Src.Shadow_Tensor);
   end;
   
   procedure Copy (Dst : in out Tensor; Src : Shadow_Tensor_Access) is
   begin
      Copy (Dst.Shadow_Tensor, Src);
   end;
   
   procedure Copy (Dst : Shadow_Tensor_Access; Src : in Tensor) is
   begin
      Copy (Dst, Src.Shadow_Tensor);
   end;
   
   -- Tensor Element accessor functions:
   
   function Element_Type (T : Tensor) return Tensor_Element_Type
   is
      use Torch_Element_Codes_H;

      Err  : aliased Ada_C_Error_Type;
      Code : Torch_Element_Code;
   begin
      Code :=
        Torch.Tensor_Element_Type_Code
          (
           T.Shadow_Tensor,
           Err'Unchecked_Access
          );

      Check_Error (Err, Enclosing_Entity);

      case Code is

         when Torch_Element_Code_Enum_TORCH_ELEMENT_BOOL =>
            return Bool_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_INT8 =>
            return Int8_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_UINT8 =>
            return UInt8_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_INT16 =>
            return Int16_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_INT32 =>
            return Int32_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_INT64 =>
            return Int64_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_FLOAT16 =>
            return Float16_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_BFLOAT16 =>
            return BFloat16_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_FLOAT32 =>
            return Float32_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_FLOAT64 =>
            return Float64_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_COMPLEX32 =>
            return Complex32_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_COMPLEX64 =>
            return Complex64_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_COMPLEX128 =>
            return Complex128_Element;

         when Torch_Element_Code_Enum_TORCH_ELEMENT_INVALID =>
            raise Program_Error with
              "tensor_element_type_code returned TORCH_ELEMENT_INVALID "
              & "without reporting an exception";

         when others =>
            raise Program_Error with
              "unknown tensor element type code returned by C++ layer";

      end case;
   end Element_Type;   
   

   function Category
     (Element_Type : Tensor_Element_Type)
     return Tensor_Number_Category
   is
   begin
      case Element_Type is

         when Bool_Element =>
            return Boolean_Category;

         when Int8_Element
           | UInt8_Element
           | Int16_Element
           | Int32_Element
           | Int64_Element =>
            return Integer_Category;

         when Float16_Element
           | BFloat16_Element
           | Float32_Element
           | Float64_Element =>
            return Floating_Point_Category;

         when Complex32_Element
           | Complex64_Element
           | Complex128_Element =>
            return Complex_Category;

      end case;
   end Category;
   
   function Is_Integer (Element_Type : Tensor_Element_Type)
                       return Boolean is
   begin
      return Category (Element_Type) = Integer_Category;
   end Is_Integer;
   
   function Is_Floating_Point (Element_Type : Tensor_Element_Type)
                       return Boolean is
   begin
      return Category (Element_Type) = Floating_Point_Category;
   end Is_Floating_Point;
   
   function Is_Complex (Element_Type : Tensor_Element_Type)
                       return Boolean is
   begin
      return Category (Element_Type) = Complex_Category;
   end Is_Complex;
   
   -- Tensor update and query functions delegated to the C++ side:
   
   function Relu (X : Tensor) return Tensor is
      Ret : Tensor;
      Err : aliased Ada_C_Error_Type;
   begin
      Tensor_Relu (Ret.Shadow_Tensor, X.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
      return Ret;
   end;
   
   function View (Self : Tensor; Params : Int64_Array) return Tensor is
      Ret : Tensor;
      Err : aliased Ada_C_Error_Type;
   begin
      Tensor_View (Ret.Shadow_Tensor, Self.Shadow_Tensor,
                   Params, Params'Length,
                   Err'Unchecked_Access);
      Check_Error (Err);
      return Ret;      
   end;
   
   function Max_Pool2d (X : Tensor; N : Int64_T) return Tensor is
      Ret : Tensor;
      Err : aliased Ada_C_Error_Type;
   begin
      Tensor_Max_Pool2d (Ret.Shadow_Tensor, X.Shadow_Tensor, N,
                         Err'Unchecked_Access);
      Check_Error (Err);
      return Ret;
   end;
   
   function Dropout (X : Tensor; P : Long_Float;
                       Is_Training : Boolean) return Tensor is
      Ret : Tensor;
      Err : aliased Ada_C_Error_Type;
   begin
      Tensor_Dropout (Ret.Shadow_Tensor, X.Shadow_Tensor, P, 
                      (if Is_Training then 1 else 0),
                      Err'Unchecked_Access);
      Check_Error (Err);
      return Ret;
   end;
   
   function Log_Softmax (X : Tensor; Dim : Int64_T) return Tensor is
      Ret : Tensor;
      Err : aliased Ada_C_Error_Type;
   begin
      Tensor_Log_Softmax (Ret.Shadow_Tensor, X.Shadow_Tensor, Dim,
                          Err'Unchecked_Access);
      Check_Error (Err);
      return Ret;
   end;
   
   function Nll_Loss (Output, Target : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           New_Tensor_Nll_Loss (Output.Shadow_Tensor, Target.Shadow_Tensor,
                                Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   function Nll_Loss_Sum (Output, Target : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           New_Tensor_Nll_Loss_Sum (Output.Shadow_Tensor, 
                                    Target.Shadow_Tensor,
                                    Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   function Nll_Loss_Sum (Output, Target : Tensor) return Float is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Float :=
        Tensor_Nll_Loss_Sum_As_Float (Output.Shadow_Tensor,
                                      Target.Shadow_Tensor,
                                      Err'Unchecked_Access)
      do
         Check_Error (Err);
      end return;
   end;
   
   function Size (T : Tensor; Dimension_Idx : Int64_T) return Int64_T is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Int64_T :=
        Tensor_Size (T.Shadow_Tensor, Dimension_Idx, Err'Unchecked_Access)
      do
         Check_Error (Err);
      end return;
   end;
   
   function Scalar (T : Tensor) return Float is
      Value : Float;
      Err : aliased Ada_C_Error_Type;
   begin
      Value := Tensor_Float_Item (T.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
      return Value;
   end;
   
   function Scalar (T : Tensor) return Int64_T is
      Value : Int64_T;
      Err : aliased Ada_C_Error_Type;
   begin
      Value := Tensor_Int64_Item (T.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
      return Value;
   end;
   
   function Is_NaN (T : Tensor) return Boolean is
      Value : Int8_T;
      Err : aliased Ada_C_Error_Type;
   begin
      Value := Tensor_Is_Nan (T.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
      return (Value /= 0); -- Truth is not a zero :)
   end;
   
   procedure Backward (T : Tensor) is
      Err : aliased Ada_C_Error_Type;
   begin
      Tensor_Backward (T.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
   end;
   
   function Arg_Max (T : Tensor; Dimension_Idx : Int64_T) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           New_Tensor_Arg_Max (T.Shadow_Tensor, Dimension_Idx, 
                               Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;
   
   function Eq (T1, T2 : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           New_Tensor_Eq (T1.Shadow_Tensor, T2.Shadow_Tensor,
                          Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;
      
   function Sum (T : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           New_Tensor_Sum (T.Shadow_Tensor, Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;

   function Min (T : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           New_Tensor_Min (T.Shadow_Tensor, Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;

   function Max (T : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           New_Tensor_Max (T.Shadow_Tensor, Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;

   function Mean (T : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           New_Tensor_Mean (T.Shadow_Tensor, Err'Unchecked_Access)
        )
      do
         Check_Error (Err);
      end return;
   end;

   -- Accessor functions:
   
   function Dim (T : Tensor) return Int64_T is
      Err : aliased Ada_C_Error_Type;
   begin
      return Retval : Int64_T :=
        Tensor_Dim (T.Shadow_Tensor, Err'Unchecked_Access)
      do
         Check_Error (Err);
      end return;
   end;
   
   function Numel (T : Tensor) return Int64_T is
      Err : aliased Ada_C_Error_Type;
   begin
      return Retval : Int64_T :=
        Tensor_Numel (T.Shadow_Tensor, Err'Unchecked_Access)
      do
         Check_Error (Err);
      end return;
   end;
   
   function Stride (T : Tensor; Dim : Int64_T) return Int64_T is
      Err : aliased Ada_C_Error_Type;
   begin
      return Retval : Int64_T :=
        Tensor_Stride (T.Shadow_Tensor, Dim, Err'Unchecked_Access)
      do
         Check_Error (Err);
      end return;
   end;
      
   function Sizes (T : Tensor) return Int64_Array is
      Err : aliased Ada_C_Error_Type;
      D   : Int64_T := Dim (T);
      S   : Int64_Array (1 .. D);
   begin
      for I in 1 .. D loop
         S (I) := Tensor_Size (T.Shadow_Tensor, I - 1, Err'Unchecked_Access);
         Check_Error (Err);
      end loop;
      return S;
   end;
   
   function Strides (T : Tensor) return Int64_Array is
      Err : aliased Ada_C_Error_Type;
      D   : Int64_T := Dim (T);
      S   : Int64_Array (1 .. D);
   begin
      for I in 1 .. D loop
         S (I) := Tensor_Stride (T.Shadow_Tensor, I - 1, Err'Unchecked_Access);
         Check_Error (Err);
      end loop;
      return S;
   end;
   
   function Is_Cuda (T : Tensor) return Boolean is
      Err    : aliased Ada_C_Error_Type;
      Retval : Int8_T;
   begin
      Retval := Tensor_Is_Cuda (T.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
      return (Retval /= 0);
   end;
   
   function Is_Contigous (T : Tensor) return Boolean is
      Err    : aliased Ada_C_Error_Type;
      Retval : Int8_T;
   begin
      Retval := Tensor_Is_Contigous (T.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
      return (Retval /= 0);
   end;   
   
   function Get_Device (T : Tensor) return Device_Index_Type is
      Err    : aliased Ada_C_Error_Type;
      Retval : Int8_T;
   begin
      Retval := Tensor_Get_Device (T.Shadow_Tensor, Err'Unchecked_Access);
      Check_Error (Err);
      return Device_Index_Type (Retval);
   end;   
   
   -- Tensor element accessor functions:
   
   function Get_Int64 (Item : Tensor; Indices : Int64_Array)
                      return Int64_T
   is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Int64_T := Torch.Tensor_Get_Int64
        (
         Item.Shadow_Tensor,
         (if Indices'Length > 0
          then Indices (Indices'First)'Unchecked_Access 
          else null),
         Indices'Length,
         Err'Unchecked_Access
        )
      do
         Check_Error (Err, Enclosing_Entity);
      end return;
   end Get_Int64;
   
   function Get_Float64 (Item : Tensor; Indices : Int64_Array)
                        return Long_Float
   is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Long_Float :=
        Long_Float
          (
           Torch.Tensor_Get_Float64
             (
              Item.Shadow_Tensor,
              (if Indices'Length > 0
               then Indices (Indices'First)'Unchecked_Access
               else null),
              Indices'Length,
              Err'Unchecked_Access
             )
          )
      do
         Check_Error (Err, Enclosing_Entity);
      end return;
   end Get_Float64;   
   
   -- -------------------------------------------------------------------------
   -- Device_Type:
   
   overriding
   procedure Finalize (D : in out Device_Type) is
   begin
      if D.Shadow_Device /= null then
         Delete_Torch_Shadow_Device (D.Shadow_Device);
      end if;
   end;   

   function Make_Device (Kind : Device_Kind_Type;
                         Idx : Device_Index_Type := -1)
                        return Device_Type is
   begin
      return Ret : Device_Type := 
        (
         Ada.Finalization.Limited_Controlled with
         Shadow_Device => New_Torch_Shadow_Device (Kind, Int8_T (Idx))
        )
      do
         if Ret.Shadow_Device = null then
            raise Storage_Error with "Could not create new torch::Device " &
              "on the C++ side in """ & Enclosing_Entity & """";
         end if;
      end return;
   end;
   
   function To (X : in out Tensor'Class; D : Device_Type'Class) 
               return Tensor is
      Ret : Tensor;
   begin
      Shadow_Tensor_To_Device (Ret.Shadow_Tensor, X.Shadow_Tensor,
                               D.Shadow_Device);
      return Ret;
   end;
   
   -- -------------------------------------------------------------------------
   
   overriding procedure Initialize (G : in out No_Grad_Guard) is
   begin
      G.Shadow_Guard := New_Shadow_No_Grad_Guard;
      if G.Shadow_Guard = null then
         raise Storage_Error with "Could not create new torch::NoGradGuard " &
           "on the C++ side in """ & Enclosing_Entity & """";
      end if;
   end;
   
   overriding procedure Finalize (G : in out No_Grad_Guard) is
   begin
      Delete_Shadow_No_Grad_Guard (G.Shadow_Guard);
   end;
   
   -- -------------------------------------------------------------------------
   -- Vector_Of_Tensor_Type
   
   overriding
   procedure Finalize (V : in out Vector_Of_Tensor_Type) is
   begin
      if V.Shadow_Vector /= null then
         Delete_Vector_Of_Tensor (V.Shadow_Vector);
      end if;
   end;
   
   overriding
   procedure Adjust (V : in out Vector_Of_Tensor_Type) is
   begin
      if V.Shadow_Vector /= null then
         V.Shadow_Vector := New_Vector_Of_Tensor (V.Shadow_Vector);
         if V.Shadow_Vector = null then
            raise Storage_Error with "Could not clone std::vector<torch::Tensor> " &
              "on the C++ side in """ & Enclosing_Entity & """";
         end if;
      end if;
   end;
   
end;
