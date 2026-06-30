with GNAT.Source_Info; use GNAT.Source_Info;

with Ada_C_Error_Codes; use Ada_C_Error_Codes;

package body Torch.Tensor_Wrappers is
   
   function Make_Tensor_From_Float_Array (Data : Float_Array) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           Torch.Tensor_Wrappers.New_Tensor_From_Float_Array
             (
              Data (Data'First)'Unchecked_Access,
              Data'Length,
              Err'Unchecked_Access
             )
        )      
      do
         Check_Error (Err, Enclosing_Entity);
         if Ret.Shadow_Tensor = null then
            raise Storage_Error with "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end;
   
   function Make_Tensor_From_Int64_Array (Data : Int64_Array) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor => 
           Torch.Tensor_Wrappers.New_Tensor_From_Int64_Array
             (
              Data (Data'First)'Unchecked_Access,
              Data'Length,
              Err'Unchecked_Access
             )
        )      
      do
         Check_Error (Err, Enclosing_Entity);
         if Ret.Shadow_Tensor = null then
            raise Storage_Error with "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end;
   
   -- ChatGPT generated code:
   
   function Zeros (Dims : Int64_Array) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Zeros
             (
              Dims (Dims'First)'Unchecked_Access,
              Dims'Length,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);
         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Zeros;
   
   
   function Ones (Dims : Int64_Array) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Ones
             (
              Dims (Dims'First)'Unchecked_Access,
              Dims'Length,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Ones;
   
   function Empty (Dims : Int64_Array) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Empty
             (
              Dims (Dims'First)'Unchecked_Access,
              Dims'Length,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Empty;
   
   function Random (Dims : Int64_Array) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Random
             (
              Dims (Dims'First)'Unchecked_Access,
              Dims'Length,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Random;
   
   function Randn (Dims : Int64_Array) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Randn
             (
              Dims (Dims'First)'Unchecked_Access,
              Dims'Length,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Randn;
   
   function Make_Tensor (Value : Int64_T) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Int64
             (
              Value,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Make_Tensor;
   
   function Make_Tensor (Value : Long_Float) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Float64
             (
              C_Double (Value),
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Make_Tensor;
   
   function Clone (Source : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.Tensor_Clone
             (
              Source.Shadow_Tensor,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Clone;
   
   function Reshape
     (Source : Tensor;
      Dims   : Int64_Array)
     return Tensor
   is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.Tensor_Reshape
             (
              Source.Shadow_Tensor,
              Dims (Dims'First)'Unchecked_Access,
              Dims'Length,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Reshape;
   
   function Zeros_Like (Source : Tensor) return Tensor is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.Tensor_Zeros_Like
             (
              Source.Shadow_Tensor,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Zeros_Like;
   
   function Arange
     (Start : Int64_T;
      Stop  : Int64_T;
      Step  : Int64_T := 1)
     return Tensor
   is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Arange
             (
              Start,
              Stop,
              Step,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Arange;
   
   function Linspace
     (Start : Long_Float;
      Stop  : Long_Float;
      Steps : Int64_T)
     return Tensor
   is
      Err : aliased Ada_C_Error_Type;
   begin
      return Ret : Tensor :=
        (
         Ada.Finalization.Controlled with
         Shadow_Tensor =>
           Torch.Tensor_Wrappers.New_Tensor_Linspace
             (
              C_Double (Start),
              C_Double (Stop),
              Steps,
              Err'Unchecked_Access
             )
        )
      do
         Check_Error (Err, Enclosing_Entity);

         if Ret.Shadow_Tensor = null then
            raise Storage_Error with
              "could not allocate shadow tensor in """ &
              Enclosing_Entity & """";
         end if;
      end return;
   end Linspace;   
   
end Torch.Tensor_Wrappers;
