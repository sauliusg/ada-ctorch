pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with c10_util_ArrayRef_h;
with ATen_core_ATen_fwd_h;
with ATen_core_TensorBase_h;
limited with c10_util_intrusive_ptr_h;
with c10_core_MemoryFormat_h;
with c10_util_MaybeOwned_h;
with c10_core_Scalar_h;
limited with ATen_core_DeprecatedTypeProperties_h;
with c10_core_ScalarType_h;
with c10_core_Backend_h;
with Interfaces.C.Extensions;
with x86_64_linux_gnu_bits_stdint_intn_h;
with cpp_14_2_0_initializer_list;
with cpp_14_2_0_optional;
with ATen_core_Dimname_h;
with c10_core_SymIntArrayRef_h;
limited with c10_core_SymInt_h;
with cpp_14_2_0_bits_stl_vector_h;
with cpp_14_2_0_tuple;
with c10_core_TensorOptions_h;
with c10_util_string_view_h;
with c10_core_QScheme_h;
with c10_core_Device_h;
limited with c10_core_Storage_h;
with c10_util_typeid_h;

package ATen_core_TensorBody_h is

   type c_Type is null record;   -- incomplete struct

   type TensorIndex is null record;   -- incomplete struct

   type TensorRef is null record;   -- incomplete struct

   subtype TensorList is c10_util_ArrayRef_h.Class_ArrayRef.ArrayRef;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:70

   subtype ITensorList is ATen_core_ATen_fwd_h.IListRef;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:71

      package Class_Tensor is
      type Tensor is limited record
         parent : aliased ATen_core_TensorBase_h.Class_TensorBase.TensorBase;
      end record
      with Import => True,
           Convention => CPP;

      function New_Tensor (arg1 : ATen_core_TensorBase_h.Class_unsafe_borrow_t.unsafe_borrow_t; rhs : access constant ATen_core_TensorBase_h.Class_TensorBase.TensorBase) return Tensor;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:97
      pragma CPP_Constructor (New_Tensor, "_ZN2at6TensorC1ENS_10TensorBase15unsafe_borrow_tERKS1_");

      function New_Tensor return Tensor;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:103
      pragma CPP_Constructor (New_Tensor, "_ZN2at6TensorC1Ev");

      function New_Tensor (tensor_impl : access c10_util_intrusive_ptr_h.Class_intrusive_ptr.intrusive_ptr) return Tensor;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:106
      pragma CPP_Constructor (New_Tensor, "_ZN2at6TensorC1EN3c1013intrusive_ptrINS1_10TensorImplENS1_19UndefinedTensorImplEEE");

      function New_Tensor (base : access constant ATen_core_TensorBase_h.Class_TensorBase.TensorBase) return Tensor;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:113
      pragma CPP_Constructor (New_Tensor, "_ZN2at6TensorC1ERKNS_10TensorBaseE");

      function New_Tensor (base : access ATen_core_TensorBase_h.Class_TensorBase.TensorBase) return Tensor;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:114
      pragma CPP_Constructor (New_Tensor, "_ZN2at6TensorC1EONS_10TensorBaseE");

      function wrap_tensor_impl (tensor_impl : access c10_util_intrusive_ptr_h.Class_intrusive_ptr.intrusive_ptr) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:118
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6Tensor16wrap_tensor_implEN3c1013intrusive_ptrINS1_10TensorImplENS1_19UndefinedTensorImplEEE";

      function contiguous (this : access constant Tensor; memory_format : c10_core_MemoryFormat_h.MemoryFormat) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:123
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10contiguousEN3c1012MemoryFormatE";

      function conj (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:127
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4conjEv";

      function expect_contiguous (this : access constant Tensor; memory_format : c10_core_MemoryFormat_h.MemoryFormat) return c10_util_MaybeOwned_h.Class_MaybeOwned.MaybeOwned  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5754
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNKR2at6Tensor17expect_contiguousEN3c1012MemoryFormatE";

      function expect_contiguous (this : access Tensor; memory_format : c10_core_MemoryFormat_h.MemoryFormat) return c10_util_MaybeOwned_h.Class_MaybeOwned.MaybeOwned  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:159
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNO2at6Tensor17expect_contiguousEN3c1012MemoryFormatE";

      function Assign_Tensor (this : access Tensor; x : access constant ATen_core_TensorBase_h.Class_TensorBase.TensorBase) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:198
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR2at6TensoraSERKNS_10TensorBaseE";

      function Assign_Tensor (this : access Tensor; x : access ATen_core_TensorBase_h.Class_TensorBase.TensorBase) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:202
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR2at6TensoraSEONS_10TensorBaseE";

      function Assign_Tensor (this : access Tensor; x : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:207
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR2at6TensoraSERKS0_";

      function Assign_Tensor (this : access Tensor; x : access Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:210
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR2at6TensoraSEOS0_";

      function Assign_Tensor (this : access Tensor; v : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:214
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNO2at6TensoraSERKN3c106ScalarE";

      function Assign_Tensor (this : access Tensor; rhs : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:217
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNO2at6TensoraSERKS0_";

      function Assign_Tensor (this : access Tensor; rhs : access Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:220
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNO2at6TensoraSEOS0_";

      function c_type (this : access constant Tensor) return access ATen_core_DeprecatedTypeProperties_h.Class_DeprecatedTypeProperties.DeprecatedTypeProperties  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:225
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4typeEv";

      function toType (this : access constant Tensor; t : c10_core_ScalarType_h.ScalarType) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:231
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6toTypeEN3c1010ScalarTypeE";

      function toBackend (this : access constant Tensor; b : c10_core_Backend_h.Backend) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:236
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9toBackendEN3c107BackendE";

      function is_variable (this : access constant Tensor) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:241
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11is_variableEv";

      function operator_ti (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:263
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6TensorcoEv";

      function operator_m (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:266
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6TensorngEv";

      function Assign_Tensor (this : access Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:269
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensorpLERKS0_";

      function Assign_Tensor (this : access Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:272
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensorpLERKN3c106ScalarE";

      function Assign_Tensor (this : access Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:275
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensormIERKS0_";

      function Assign_Tensor (this : access Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:278
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensormIERKN3c106ScalarE";

      function Assign_Tensor (this : access Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:281
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensormLERKS0_";

      function Assign_Tensor (this : access Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:284
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensormLERKN3c106ScalarE";

      function Assign_Tensor (this : access Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:287
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensordVERKS0_";

      function Assign_Tensor (this : access Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:290
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensordVERKN3c106ScalarE";

      function Assign_Tensor (this : access Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:293
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensoraNERKS0_";

      function Assign_Tensor (this : access Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:296
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensoroRERKS0_";

      function Assign_Tensor (this : access Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:299
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6TensoreOERKS0_";

      function operator_ob (this : access constant Tensor; index : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:302
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6TensorixERKN3c106ScalarE";

      function operator_ob (this : access constant Tensor; index : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:308
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6TensorixERKS0_";

      function operator_ob (this : access constant Tensor; index : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:321
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6TensorixEl";

      function index (this : access constant Tensor; indices : c10_util_ArrayRef_h.ArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:325
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5indexEN3c108ArrayRefINS_8indexing11TensorIndexEEE";

      function index2 (this : access constant Tensor; indices : cpp_14_2_0_initializer_list.initializer_list) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:326
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5indexESt16initializer_listINS_8indexing11TensorIndexEE";

      function index_put_u
        (this : access Tensor;
         indices : c10_util_ArrayRef_h.ArrayRef;
         rhs : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:328
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6Tensor10index_put_EN3c108ArrayRefINS_8indexing11TensorIndexEEERKS0_";

      function index_put_u
        (this : access Tensor;
         indices : c10_util_ArrayRef_h.ArrayRef;
         v : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:329
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6Tensor10index_put_EN3c108ArrayRefINS_8indexing11TensorIndexEEERKNS1_6ScalarE";

      function index_put_u
        (this : access Tensor;
         indices : cpp_14_2_0_initializer_list.initializer_list;
         rhs : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:330
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6Tensor10index_put_ESt16initializer_listINS_8indexing11TensorIndexEERKS0_";

      function index_put_u
        (this : access Tensor;
         indices : cpp_14_2_0_initializer_list.initializer_list;
         v : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:331
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at6Tensor10index_put_ESt16initializer_listINS_8indexing11TensorIndexEERKN3c106ScalarE";

      function cpu (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:333
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3cpuEv";

      function cuda (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:338
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4cudaEv";

      function hip (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:342
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3hipEv";

      function ve (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:346
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2veEv";

      function vulkan (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:350
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6vulkanEv";

      function metal (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:354
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5metalEv";

      function meta (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:358
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4metaEv";

      procedure backward
        (this : access constant Tensor;
         gradient : access constant Tensor;
         retain_graph : cpp_14_2_0_optional.Class_optional.optional;
         create_graph : Extensions.bool;
         inputs : cpp_14_2_0_optional.Class_optional.optional)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:436
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8backwardERKS0_St8optionalIbEbS3_IN3c108ArrayRefIS0_EEE";

      function set_requires_grad (this : access constant Tensor; requires_grad : Extensions.bool) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:469
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor17set_requires_gradEb";

      function mutable_grad (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:478
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12mutable_gradEv";

      function grad (this : access constant Tensor) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:486
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4gradEv";

      --  skipped func _fw_grad

      --  skipped func _set_fw_grad

      --  skipped func __dispatch__backward

      --  skipped func __dispatch_set_data

      --  skipped func __dispatch_data

      --  skipped func __dispatch_is_leaf

      --  skipped func __dispatch_output_nr

      --  skipped func __dispatch__version

      --  skipped func __dispatch_requires_grad_

      --  skipped func __dispatch_retain_grad

      --  skipped func __dispatch_retains_grad

      --  skipped func _fw_primal

      function rename_u (this : access constant Tensor; names : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1538
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7rename_ESt8optionalIN3c108ArrayRefINS_7DimnameEEEE";

      function rename (this : access constant Tensor; names : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1543
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6renameESt8optionalIN3c108ArrayRefINS_7DimnameEEEE";

      function align_to (this : access constant Tensor; names : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1548
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8align_toEN3c108ArrayRefINS_7DimnameEEE";

      function align_to
        (this : access constant Tensor;
         order : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         ellipsis_idx : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1553
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8align_toEN3c108ArrayRefINS_7DimnameEEEl";

      function align_as (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1558
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8align_asERKS0_";

      function refine_names (this : access constant Tensor; names : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1563
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12refine_namesEN3c108ArrayRefINS_7DimnameEEE";

      function c_abs (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1568
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3absEv";

      function abs_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1573
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4abs_Ev";

      function absolute (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1578
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8absoluteEv";

      function absolute_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1583
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9absolute_Ev";

      function angle (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1588
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5angleEv";

      function sgn (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1593
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3sgnEv";

      function sgn_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1598
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sgn_Ev";

      function chalf (this : access constant Tensor; memory_format : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1603
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5chalfESt8optionalIN3c1012MemoryFormatEE";

      --  skipped func _conj

      --  skipped func __dispatch_conj

      --  skipped func _conj_physical

      function conj_physical (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1623
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13conj_physicalEv";

      function conj_physical_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1628
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14conj_physical_Ev";

      function resolve_conj (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1633
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12resolve_conjEv";

      function resolve_neg (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1638
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11resolve_negEv";

      --  skipped func _neg_view

      function acos (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1648
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4acosEv";

      function acos_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1653
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5acos_Ev";

      function arccos (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1658
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6arccosEv";

      function arccos_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1663
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7arccos_Ev";

      function add
        (this : access constant Tensor;
         other : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1668
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3addERKS0_RKN3c106ScalarE";

      function add_u
        (this : access constant Tensor;
         other : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1673
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4add_ERKS0_RKN3c106ScalarE";

      function add
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1678
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3addERKN3c106ScalarES4_";

      function add_u
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1683
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4add_ERKN3c106ScalarES4_";

      function addmv
        (this : access constant Tensor;
         mat : access constant Tensor;
         vec : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1688
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5addmvERKS0_S2_RKN3c106ScalarES6_";

      function addmv_u
        (this : access constant Tensor;
         mat : access constant Tensor;
         vec : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1693
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6addmv_ERKS0_S2_RKN3c106ScalarES6_";

      function addr
        (this : access constant Tensor;
         vec1 : access constant Tensor;
         vec2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1698
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4addrERKS0_S2_RKN3c106ScalarES6_";

      function addr_u
        (this : access constant Tensor;
         vec1 : access constant Tensor;
         vec2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1703
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5addr_ERKS0_S2_RKN3c106ScalarES6_";

      --  skipped func _is_all_true

      --  skipped func _is_any_true

      function c_all
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1718
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3allElb";

      function c_all
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1723
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3allEN3c1016OptionalArrayRefIlEEb";

      function c_all
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1728
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3allENS_7DimnameEb";

      function allclose
        (this : access constant Tensor;
         other : access constant Tensor;
         rtol : double;
         atol : double;
         equal_nan : Extensions.bool) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1733
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8allcloseERKS0_ddb";

      function any
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1738
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3anyElb";

      function any
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1743
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3anyEN3c1016OptionalArrayRefIlEEb";

      function any
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1748
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3anyENS_7DimnameEb";

      function argmax
        (this : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1753
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6argmaxESt8optionalIlEb";

      function argmin
        (this : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1758
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6argminESt8optionalIlEb";

      function acosh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1763
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5acoshEv";

      function acosh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1768
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6acosh_Ev";

      function arccosh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1773
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7arccoshEv";

      function arccosh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1778
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8arccosh_Ev";

      function asinh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1783
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5asinhEv";

      function asinh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1788
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6asinh_Ev";

      function arcsinh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1793
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7arcsinhEv";

      function arcsinh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1798
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8arcsinh_Ev";

      function atanh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1803
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5atanhEv";

      function atanh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1808
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6atanh_Ev";

      function arctanh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1813
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7arctanhEv";

      function arctanh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1818
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8arctanh_Ev";

      function as_strided
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         stride : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         storage_offset : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1823
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10as_stridedEN3c108ArrayRefIlEES3_St8optionalIlE";

      function as_strided_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         stride : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         storage_offset : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1828
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor17as_strided_symintEN3c108ArrayRefINS1_6SymIntEEES4_St8optionalIS3_E";

      function as_strided_u
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         stride : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         storage_offset : cpp_14_2_0_optional.Class_optional.optional) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1833
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11as_strided_EN3c108ArrayRefIlEES3_St8optionalIlE";

      function as_strided_u_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         stride : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         storage_offset : access cpp_14_2_0_optional.Class_optional.optional) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1838
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18as_strided__symintEN3c108ArrayRefINS1_6SymIntEEES4_St8optionalIS3_E";

      function asin (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1843
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4asinEv";

      function asin_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1848
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5asin_Ev";

      function arcsin (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1853
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6arcsinEv";

      function arcsin_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1858
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7arcsin_Ev";

      function atan (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1863
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4atanEv";

      function atan_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1868
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5atan_Ev";

      function arctan (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1873
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6arctanEv";

      function arctan_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1878
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7arctan_Ev";

      function baddbmm
        (this : access constant Tensor;
         batch1 : access constant Tensor;
         batch2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1883
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7baddbmmERKS0_S2_RKN3c106ScalarES6_";

      function baddbmm_u
        (this : access constant Tensor;
         batch1 : access constant Tensor;
         batch2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1888
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8baddbmm_ERKS0_S2_RKN3c106ScalarES6_";

      function bernoulli (this : access constant Tensor; generator : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1893
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9bernoulliESt8optionalINS_9GeneratorEE";

      function bernoulli_u
        (this : access constant Tensor;
         p : access constant Tensor;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1898
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10bernoulli_ERKS0_St8optionalINS_9GeneratorEE";

      function bernoulli_u
        (this : access constant Tensor;
         p : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1903
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10bernoulli_EdSt8optionalINS_9GeneratorEE";

      function bernoulli
        (this : access constant Tensor;
         p : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1908
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9bernoulliEdSt8optionalINS_9GeneratorEE";

      function bincount
        (this : access constant Tensor;
         weights : access constant cpp_14_2_0_optional.Class_optional.optional;
         minlength : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1913
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8bincountERKSt8optionalIS0_El";

      function bincount_symint
        (this : access constant Tensor;
         weights : access constant cpp_14_2_0_optional.Class_optional.optional;
         minlength : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1918
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15bincount_symintERKSt8optionalIS0_EN3c106SymIntE";

      function bitwise_not (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1923
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11bitwise_notEv";

      function bitwise_not_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1928
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12bitwise_not_Ev";

      function copysign (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1933
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8copysignERKS0_";

      function copysign_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1938
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9copysign_ERKS0_";

      function copysign (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1943
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8copysignERKN3c106ScalarE";

      function copysign_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1948
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9copysign_ERKN3c106ScalarE";

      --  skipped func _lazy_clone

      function logical_not (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1958
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11logical_notEv";

      function logical_not_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1963
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12logical_not_Ev";

      function logical_xor (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1968
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11logical_xorERKS0_";

      function logical_xor_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1973
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12logical_xor_ERKS0_";

      function logical_and (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1978
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11logical_andERKS0_";

      function logical_and_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1983
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12logical_and_ERKS0_";

      function logical_or (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1988
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10logical_orERKS0_";

      function logical_or_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1993
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11logical_or_ERKS0_";

      function bmm (this : access constant Tensor; mat2 : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1998
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3bmmERKS0_";

      function broadcast_to (this : access constant Tensor; size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2003
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12broadcast_toEN3c108ArrayRefIlEE";

      function broadcast_to_symint (this : access constant Tensor; size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2008
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19broadcast_to_symintEN3c108ArrayRefINS1_6SymIntEEE";

      function ceil (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2013
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4ceilEv";

      function ceil_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2018
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5ceil_Ev";

      function unsafe_chunk
        (this : access constant Tensor;
         chunks : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2023
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12unsafe_chunkEll";

      function chunk
        (this : access constant Tensor;
         chunks : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2028
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5chunkEll";

      function tensor_split
        (this : access constant Tensor;
         sections : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2033
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12tensor_splitEll";

      function tensor_split_symint
        (this : access constant Tensor;
         sections : access c10_core_SymInt_h.Class_SymInt.SymInt;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2038
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19tensor_split_symintEN3c106SymIntEl";

      function tensor_split
        (this : access constant Tensor;
         indices : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2043
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12tensor_splitEN3c108ArrayRefIlEEl";

      function tensor_split_symint
        (this : access constant Tensor;
         indices : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2048
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19tensor_split_symintEN3c108ArrayRefINS1_6SymIntEEEl";

      function tensor_split
        (this : access constant Tensor;
         tensor_indices_or_sections : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2053
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12tensor_splitERKS0_l";

      function clamp
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2058
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5clampERKSt8optionalIN3c106ScalarEES6_";

      function clamp
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2063
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5clampERKSt8optionalIS0_ES4_";

      function clamp_u
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2068
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6clamp_ERKSt8optionalIN3c106ScalarEES6_";

      function clamp_u
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2073
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6clamp_ERKSt8optionalIS0_ES4_";

      function clamp_max (this : access constant Tensor; max : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2078
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9clamp_maxERKN3c106ScalarE";

      function clamp_max (this : access constant Tensor; max : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2083
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9clamp_maxERKS0_";

      function clamp_max_u (this : access constant Tensor; max : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2088
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10clamp_max_ERKN3c106ScalarE";

      function clamp_max_u (this : access constant Tensor; max : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2093
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10clamp_max_ERKS0_";

      function clamp_min (this : access constant Tensor; min : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2098
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9clamp_minERKN3c106ScalarE";

      function clamp_min (this : access constant Tensor; min : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2103
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9clamp_minERKS0_";

      function clamp_min_u (this : access constant Tensor; min : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2108
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10clamp_min_ERKN3c106ScalarE";

      function clamp_min_u (this : access constant Tensor; min : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2113
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10clamp_min_ERKS0_";

      function clip
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2118
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4clipERKSt8optionalIN3c106ScalarEES6_";

      function clip
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2123
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4clipERKSt8optionalIS0_ES4_";

      function clip_u
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2128
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5clip_ERKSt8optionalIN3c106ScalarEES6_";

      function clip_u
        (this : access constant Tensor;
         min : access constant cpp_14_2_0_optional.Class_optional.optional;
         max : access constant cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2133
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5clip_ERKSt8optionalIS0_ES4_";

      --  skipped func __dispatch_contiguous

      function copy_u
        (this : access constant Tensor;
         src : access constant Tensor;
         non_blocking : Extensions.bool) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2143
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5copy_ERKS0_b";

      function cos (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2148
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3cosEv";

      function cos_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2153
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4cos_Ev";

      function cosh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2158
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4coshEv";

      function cosh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2163
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5cosh_Ev";

      function count_nonzero (this : access constant Tensor; dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2168
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13count_nonzeroEN3c108ArrayRefIlEE";

      function count_nonzero (this : access constant Tensor; dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2173
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13count_nonzeroESt8optionalIlE";

      function cov
        (this : access constant Tensor;
         correction : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         fweights : access constant cpp_14_2_0_optional.Class_optional.optional;
         aweights : access constant cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2178
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3covElRKSt8optionalIS0_ES4_";

      function corrcoef (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2183
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8corrcoefEv";

      function cummax (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2188
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6cummaxEl";

      function cummax (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2193
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6cummaxENS_7DimnameE";

      function cummin (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2198
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6cumminEl";

      function cummin (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2203
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6cumminENS_7DimnameE";

      function cumprod
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2208
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7cumprodElSt8optionalIN3c1010ScalarTypeEE";

      function cumprod_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2213
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8cumprod_ElSt8optionalIN3c1010ScalarTypeEE";

      function cumprod
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2218
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7cumprodENS_7DimnameESt8optionalIN3c1010ScalarTypeEE";

      function cumprod_u
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2223
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8cumprod_ENS_7DimnameESt8optionalIN3c1010ScalarTypeEE";

      function cumsum
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2228
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6cumsumElSt8optionalIN3c1010ScalarTypeEE";

      function cumsum_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2233
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7cumsum_ElSt8optionalIN3c1010ScalarTypeEE";

      function cumsum
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2238
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6cumsumENS_7DimnameESt8optionalIN3c1010ScalarTypeEE";

      function cumsum_u
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2243
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7cumsum_ENS_7DimnameESt8optionalIN3c1010ScalarTypeEE";

      function diag_embed
        (this : access constant Tensor;
         offset : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim2 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2248
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10diag_embedElll";

      function diagflat (this : access constant Tensor; offset : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2253
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8diagflatEl";

      function diagonal
        (this : access constant Tensor;
         offset : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim2 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2258
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8diagonalElll";

      function diagonal
        (this : access constant Tensor;
         outdim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dim1 : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dim2 : ATen_core_Dimname_h.Class_Dimname.Dimname;
         offset : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2263
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8diagonalENS_7DimnameES1_S1_l";

      function fill_diagonal_u
        (this : access constant Tensor;
         fill_value : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         wrap : Extensions.bool) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2268
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14fill_diagonal_ERKN3c106ScalarEb";

      function diff
        (this : access constant Tensor;
         n : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         prepend : access constant cpp_14_2_0_optional.Class_optional.optional;
         append : access constant cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2273
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4diffEllRKSt8optionalIS0_ES4_";

      function div (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2278
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3divERKS0_";

      function div_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2283
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4div_ERKS0_";

      function div
        (this : access constant Tensor;
         other : access constant Tensor;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2288
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3divERKS0_St8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function div_u
        (this : access constant Tensor;
         other : access constant Tensor;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2293
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4div_ERKS0_St8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function div (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2298
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3divERKN3c106ScalarE";

      function div_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2303
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4div_ERKN3c106ScalarE";

      function div
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2308
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3divERKN3c106ScalarESt8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function div_u
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2313
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4div_ERKN3c106ScalarESt8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function divide (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2318
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6divideERKS0_";

      function divide_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2323
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7divide_ERKS0_";

      function divide (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2328
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6divideERKN3c106ScalarE";

      function divide_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2333
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7divide_ERKN3c106ScalarE";

      function divide
        (this : access constant Tensor;
         other : access constant Tensor;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2338
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6divideERKS0_St8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function divide_u
        (this : access constant Tensor;
         other : access constant Tensor;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2343
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7divide_ERKS0_St8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function divide
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2348
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6divideERKN3c106ScalarESt8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function divide_u
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         rounding_mode : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2353
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7divide_ERKN3c106ScalarESt8optionalISt17basic_string_viewIcSt11char_traitsIcEEE";

      function true_divide (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2358
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11true_divideERKS0_";

      function true_divide_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2363
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12true_divide_ERKS0_";

      function true_divide (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2368
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11true_divideERKN3c106ScalarE";

      function true_divide_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2373
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12true_divide_ERKN3c106ScalarE";

      function dot (this : access constant Tensor; tensor : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2378
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3dotERKS0_";

      function vdot (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2383
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4vdotERKS0_";

      function new_empty
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2388
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9new_emptyEN3c108ArrayRefIlEENS1_13TensorOptionsE";

      function new_empty
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2393
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9new_emptyEN3c108ArrayRefIlEESt8optionalINS1_10ScalarTypeEES4_INS1_6LayoutEES4_INS1_6DeviceEES4_IbE";

      function new_empty_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2398
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16new_empty_symintEN3c108ArrayRefINS1_6SymIntEEENS1_13TensorOptionsE";

      function new_empty_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2403
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16new_empty_symintEN3c108ArrayRefINS1_6SymIntEEESt8optionalINS1_10ScalarTypeEES5_INS1_6LayoutEES5_INS1_6DeviceEES5_IbE";

      function new_empty_strided
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         stride : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2408
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor17new_empty_stridedEN3c108ArrayRefIlEES3_NS1_13TensorOptionsE";

      function new_empty_strided
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         stride : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2413
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor17new_empty_stridedEN3c108ArrayRefIlEES3_St8optionalINS1_10ScalarTypeEES4_INS1_6LayoutEES4_INS1_6DeviceEES4_IbE";

      function new_empty_strided_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         stride : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2418
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor24new_empty_strided_symintEN3c108ArrayRefINS1_6SymIntEEES4_NS1_13TensorOptionsE";

      function new_empty_strided_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         stride : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2423
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor24new_empty_strided_symintEN3c108ArrayRefINS1_6SymIntEEES4_St8optionalINS1_10ScalarTypeEES5_INS1_6LayoutEES5_INS1_6DeviceEES5_IbE";

      function new_full
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         fill_value : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2428
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8new_fullEN3c108ArrayRefIlEERKNS1_6ScalarENS1_13TensorOptionsE";

      function new_full
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         fill_value : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2433
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8new_fullEN3c108ArrayRefIlEERKNS1_6ScalarESt8optionalINS1_10ScalarTypeEES7_INS1_6LayoutEES7_INS1_6DeviceEES7_IbE";

      function new_full_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         fill_value : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2438
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15new_full_symintEN3c108ArrayRefINS1_6SymIntEEERKNS1_6ScalarENS1_13TensorOptionsE";

      function new_full_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         fill_value : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2443
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15new_full_symintEN3c108ArrayRefINS1_6SymIntEEERKNS1_6ScalarESt8optionalINS1_10ScalarTypeEES8_INS1_6LayoutEES8_INS1_6DeviceEES8_IbE";

      function new_zeros
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2448
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9new_zerosEN3c108ArrayRefIlEENS1_13TensorOptionsE";

      function new_zeros
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2453
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9new_zerosEN3c108ArrayRefIlEESt8optionalINS1_10ScalarTypeEES4_INS1_6LayoutEES4_INS1_6DeviceEES4_IbE";

      function new_zeros_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2458
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16new_zeros_symintEN3c108ArrayRefINS1_6SymIntEEENS1_13TensorOptionsE";

      function new_zeros_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2463
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16new_zeros_symintEN3c108ArrayRefINS1_6SymIntEEESt8optionalINS1_10ScalarTypeEES5_INS1_6LayoutEES5_INS1_6DeviceEES5_IbE";

      function new_ones
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2468
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8new_onesEN3c108ArrayRefIlEENS1_13TensorOptionsE";

      function new_ones
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2473
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8new_onesEN3c108ArrayRefIlEESt8optionalINS1_10ScalarTypeEES4_INS1_6LayoutEES4_INS1_6DeviceEES4_IbE";

      function new_ones_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2478
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15new_ones_symintEN3c108ArrayRefINS1_6SymIntEEENS1_13TensorOptionsE";

      function new_ones_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2483
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15new_ones_symintEN3c108ArrayRefINS1_6SymIntEEESt8optionalINS1_10ScalarTypeEES5_INS1_6LayoutEES5_INS1_6DeviceEES5_IbE";

      function resize_u
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2488
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7resize_EN3c108ArrayRefIlEESt8optionalINS1_12MemoryFormatEE";

      function resize_u_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2493
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14resize__symintEN3c108ArrayRefINS1_6SymIntEEESt8optionalINS1_12MemoryFormatEE";

      function erf (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2498
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3erfEv";

      function erf_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2503
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4erf_Ev";

      function erfc (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2508
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4erfcEv";

      function erfc_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2513
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5erfc_Ev";

      function exp (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2518
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3expEv";

      function exp_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2523
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4exp_Ev";

      function exp2 (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2528
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4exp2Ev";

      function exp2_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2533
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5exp2_Ev";

      function expm1 (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2538
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5expm1Ev";

      function expm1_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2543
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6expm1_Ev";

      function expand
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         implicit : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2548
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6expandEN3c108ArrayRefIlEEb";

      function expand_symint
        (this : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         implicit : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2553
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13expand_symintEN3c108ArrayRefINS1_6SymIntEEEb";

      function expand_as (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2558
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9expand_asERKS0_";

      function flatten
        (this : access constant Tensor;
         start_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         end_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2563
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7flattenEll";

      function flatten
        (this : access constant Tensor;
         start_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         end_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         out_dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2568
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7flattenEllNS_7DimnameE";

      function flatten
        (this : access constant Tensor;
         start_dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         end_dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         out_dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2573
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7flattenENS_7DimnameES1_S1_";

      function flatten
        (this : access constant Tensor;
         dims : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         out_dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2578
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7flattenEN3c108ArrayRefINS_7DimnameEEES3_";

      function unflatten
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         sizes : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2583
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9unflattenElN3c108ArrayRefIlEE";

      function unflatten_symint
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         sizes : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2588
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16unflatten_symintElN3c108ArrayRefINS1_6SymIntEEE";

      function unflatten
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         sizes : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         names : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2593
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9unflattenENS_7DimnameEN3c108ArrayRefIlEENS3_IS1_EE";

      function unflatten_symint
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         sizes : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         names : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2598
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16unflatten_symintENS_7DimnameEN3c108ArrayRefINS2_6SymIntEEENS3_IS1_EE";

      function fill_u (this : access constant Tensor; value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2603
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5fill_ERKN3c106ScalarE";

      function fill_u (this : access constant Tensor; value : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2608
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5fill_ERKS0_";

      function floor (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2613
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5floorEv";

      function floor_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2618
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6floor_Ev";

      function floor_divide (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2623
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12floor_divideERKS0_";

      function floor_divide_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2628
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13floor_divide_ERKS0_";

      function floor_divide (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2633
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12floor_divideERKN3c106ScalarE";

      function floor_divide_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2638
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13floor_divide_ERKN3c106ScalarE";

      function frac (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2643
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4fracEv";

      function frac_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2648
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5frac_Ev";

      function gcd (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2653
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3gcdERKS0_";

      function gcd_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2658
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4gcd_ERKS0_";

      function lcm (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2663
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3lcmERKS0_";

      function lcm_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2668
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4lcm_ERKS0_";

      function index3 (this : access constant Tensor; indices : access constant ATen_core_ATen_fwd_h.List) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2673
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5indexERKN3c104ListISt8optionalIS0_EEE";

      function index_copy_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         source : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2678
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11index_copy_ElRKS0_S2_";

      function index_copy
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         source : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2683
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_copyElRKS0_S2_";

      function index_copy_u
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         source : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2688
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11index_copy_ENS_7DimnameERKS0_S3_";

      function index_copy
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         source : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2693
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_copyENS_7DimnameERKS0_S3_";

      function index_put_u
        (this : access constant Tensor;
         indices : access constant ATen_core_ATen_fwd_h.List;
         values : access constant Tensor;
         accumulate : Extensions.bool) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2698
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_put_ERKN3c104ListISt8optionalIS0_EEERKS0_b";

      function index_put
        (this : access constant Tensor;
         indices : access constant ATen_core_ATen_fwd_h.List;
         values : access constant Tensor;
         accumulate : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2703
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9index_putERKN3c104ListISt8optionalIS0_EEERKS0_b";

      function isclose
        (this : access constant Tensor;
         other : access constant Tensor;
         rtol : double;
         atol : double;
         equal_nan : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2708
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7iscloseERKS0_ddb";

      function isnan (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2713
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5isnanEv";

      function is_distributed (this : access constant Tensor) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2718
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14is_distributedEv";

      --  skipped func __dispatch_is_floating_point

      --  skipped func __dispatch_is_complex

      --  skipped func __dispatch_is_conj

      --  skipped func __dispatch__is_zerotensor

      --  skipped func __dispatch_is_neg

      function isreal (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2748
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6isrealEv";

      function is_nonzero (this : access constant Tensor) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2753
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10is_nonzeroEv";

      function is_same_size (this : access constant Tensor; other : access constant Tensor) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2758
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12is_same_sizeERKS0_";

      --  skipped func __dispatch_is_signed

      --  skipped func __dispatch_is_inference

      function kron (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2773
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4kronERKS0_";

      function kthvalue
        (this : access constant Tensor;
         k : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2778
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8kthvalueEllb";

      function kthvalue_symint
        (this : access constant Tensor;
         k : access c10_core_SymInt_h.Class_SymInt.SymInt;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2783
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15kthvalue_symintEN3c106SymIntElb";

      function kthvalue
        (this : access constant Tensor;
         k : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2788
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8kthvalueElNS_7DimnameEb";

      function kthvalue_symint
        (this : access constant Tensor;
         k : access c10_core_SymInt_h.Class_SymInt.SymInt;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2793
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15kthvalue_symintEN3c106SymIntENS_7DimnameEb";

      function nan_to_num
        (this : access constant Tensor;
         nan : cpp_14_2_0_optional.Class_optional.optional;
         posinf : cpp_14_2_0_optional.Class_optional.optional;
         neginf : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2798
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10nan_to_numESt8optionalIdES2_S2_";

      function nan_to_num_u
        (this : access constant Tensor;
         nan : cpp_14_2_0_optional.Class_optional.optional;
         posinf : cpp_14_2_0_optional.Class_optional.optional;
         neginf : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2803
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11nan_to_num_ESt8optionalIdES2_S2_";

      function ldexp (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2808
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5ldexpERKS0_";

      function ldexp_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2813
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6ldexp_ERKS0_";

      function log (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2818
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3logEv";

      function log_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2823
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4log_Ev";

      function log10 (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2828
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5log10Ev";

      function log10_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2833
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6log10_Ev";

      function log1p (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2838
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5log1pEv";

      function log1p_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2843
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6log1p_Ev";

      function log2 (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2848
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4log2Ev";

      function log2_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2853
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5log2_Ev";

      function logaddexp (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2858
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9logaddexpERKS0_";

      function logaddexp2 (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2863
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10logaddexp2ERKS0_";

      function xlogy (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2868
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5xlogyERKS0_";

      function xlogy (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2873
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5xlogyERKN3c106ScalarE";

      function xlogy_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2878
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6xlogy_ERKS0_";

      function xlogy_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2883
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6xlogy_ERKN3c106ScalarE";

      function log_softmax
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2888
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11log_softmaxElSt8optionalIN3c1010ScalarTypeEE";

      function log_softmax
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2893
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11log_softmaxENS_7DimnameESt8optionalIN3c1010ScalarTypeEE";

      function logcumsumexp (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2898
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12logcumsumexpEl";

      function logcumsumexp (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2903
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12logcumsumexpENS_7DimnameE";

      function logsumexp
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2908
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9logsumexpEN3c108ArrayRefIlEEb";

      function logsumexp
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2913
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9logsumexpEN3c108ArrayRefINS_7DimnameEEEb";

      function matmul (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2918
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6matmulERKS0_";

      function matrix_power (this : access constant Tensor; n : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2923
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12matrix_powerEl";

      function matrix_exp (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2928
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10matrix_expEv";

      function aminmax
        (this : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2933
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7aminmaxESt8optionalIlEb";

      function max
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2938
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3maxElb";

      function max
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2943
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3maxENS_7DimnameEb";

      function amax
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2948
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4amaxEN3c108ArrayRefIlEEb";

      function mean (this : access constant Tensor; dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2953
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4meanESt8optionalIN3c1010ScalarTypeEE";

      function mean
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2958
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4meanEN3c1016OptionalArrayRefIlEEbSt8optionalINS1_10ScalarTypeEE";

      function mean
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2963
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4meanEN3c108ArrayRefINS_7DimnameEEEbSt8optionalINS1_10ScalarTypeEE";

      function nanmean
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2968
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7nanmeanEN3c1016OptionalArrayRefIlEEbSt8optionalINS1_10ScalarTypeEE";

      function median (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2973
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6medianEv";

      function median
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2978
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6medianElb";

      function median
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2983
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6medianENS_7DimnameEb";

      function nanmedian (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2988
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9nanmedianEv";

      function nanmedian
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2993
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9nanmedianElb";

      function nanmedian
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:2998
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9nanmedianENS_7DimnameEb";

      function min
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3003
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3minElb";

      function min
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3008
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3minENS_7DimnameEb";

      function amin
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3013
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4aminEN3c108ArrayRefIlEEb";

      function mm (this : access constant Tensor; mat2 : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3018
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2mmERKS0_";

      function mode
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3023
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4modeElb";

      function mode
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3028
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4modeENS_7DimnameEb";

      function mul (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3033
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3mulERKS0_";

      function mul_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3038
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4mul_ERKS0_";

      function mul (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3043
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3mulERKN3c106ScalarE";

      function mul_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3048
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4mul_ERKN3c106ScalarE";

      function multiply (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3053
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8multiplyERKS0_";

      function multiply_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3058
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9multiply_ERKS0_";

      function multiply (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3063
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8multiplyERKN3c106ScalarE";

      function multiply_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3068
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9multiply_ERKN3c106ScalarE";

      function mv (this : access constant Tensor; vec : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3073
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2mvERKS0_";

      function mvlgamma (this : access constant Tensor; p : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3078
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8mvlgammaEl";

      function mvlgamma_u (this : access constant Tensor; p : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3083
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9mvlgamma_El";

      function narrow_copy
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         length : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3088
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11narrow_copyElll";

      function narrow_copy_symint
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : access c10_core_SymInt_h.Class_SymInt.SymInt;
         length : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3093
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18narrow_copy_symintElN3c106SymIntES2_";

      function narrow
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         length : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3098
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6narrowElll";

      function narrow_symint
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : access c10_core_SymInt_h.Class_SymInt.SymInt;
         length : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3103
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13narrow_symintElN3c106SymIntES2_";

      function narrow
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : access constant Tensor;
         length : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3108
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6narrowElRKS0_l";

      function narrow_symint
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : access constant Tensor;
         length : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3113
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13narrow_symintElRKS0_N3c106SymIntE";

      function permute (this : access constant Tensor; dims : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3118
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7permuteEN3c108ArrayRefIlEE";

      function movedim
        (this : access constant Tensor;
         source : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         destination : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3123
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7movedimEN3c108ArrayRefIlEES3_";

      function movedim
        (this : access constant Tensor;
         source : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         destination : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3128
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7movedimEll";

      function moveaxis
        (this : access constant Tensor;
         source : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         destination : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3133
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8moveaxisEN3c108ArrayRefIlEES3_";

      function moveaxis
        (this : access constant Tensor;
         source : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         destination : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3138
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8moveaxisEll";

      function numpy_T (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3143
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7numpy_TEv";

      function matrix_H (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3148
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8matrix_HEv";

      function mT (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3153
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2mTEv";

      function mH (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3158
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2mHEv";

      function adjoint (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3163
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7adjointEv";

      function is_pinned (this : access constant Tensor; device : cpp_14_2_0_optional.Class_optional.optional) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3168
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9is_pinnedESt8optionalIN3c106DeviceEE";

      function pin_memory (this : access constant Tensor; device : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3173
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10pin_memoryESt8optionalIN3c106DeviceEE";

      function pinverse (this : access constant Tensor; rcond : double) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3178
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8pinverseEd";

      function rad2deg (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3183
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7rad2degEv";

      function rad2deg_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3188
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8rad2deg_Ev";

      function deg2rad (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3193
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7deg2radEv";

      function deg2rad_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3198
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8deg2rad_Ev";

      function ravel (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3203
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5ravelEv";

      function reciprocal (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3208
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10reciprocalEv";

      function reciprocal_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3213
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11reciprocal_Ev";

      function neg (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3218
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3negEv";

      function neg_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3223
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4neg_Ev";

      function negative (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3228
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8negativeEv";

      function negative_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3233
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9negative_Ev";

      function repeat (this : access constant Tensor; repeats : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3238
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6repeatEN3c108ArrayRefIlEE";

      function repeat_symint (this : access constant Tensor; repeats : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3243
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13repeat_symintEN3c108ArrayRefINS1_6SymIntEEE";

      function repeat_interleave
        (this : access constant Tensor;
         repeats : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         output_size : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3248
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor17repeat_interleaveERKS0_St8optionalIlES4_";

      function repeat_interleave_symint
        (this : access constant Tensor;
         repeats : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         output_size : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3253
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor24repeat_interleave_symintERKS0_St8optionalIlES3_IN3c106SymIntEE";

      function repeat_interleave
        (this : access constant Tensor;
         repeats : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         output_size : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3258
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor17repeat_interleaveElSt8optionalIlES2_";

      function repeat_interleave_symint
        (this : access constant Tensor;
         repeats : access c10_core_SymInt_h.Class_SymInt.SymInt;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         output_size : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3263
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor24repeat_interleave_symintEN3c106SymIntESt8optionalIlES3_IS2_E";

      function reshape (this : access constant Tensor; shape : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3268
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7reshapeEN3c108ArrayRefIlEE";

      function reshape_symint (this : access constant Tensor; shape : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3273
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14reshape_symintEN3c108ArrayRefINS1_6SymIntEEE";

      --  skipped func _reshape_alias

      --  skipped func _reshape_alias_symint

      function reshape_as (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3288
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10reshape_asERKS0_";

      function round (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3293
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5roundEv";

      function round_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3298
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6round_Ev";

      function round (this : access constant Tensor; decimals : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3303
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5roundEl";

      function round_u (this : access constant Tensor; decimals : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3308
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6round_El";

      function relu (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3313
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4reluEv";

      function relu_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3318
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5relu_Ev";

      function prelu (this : access constant Tensor; weight : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3323
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5preluERKS0_";

      function hardshrink (this : access constant Tensor; lambd : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3328
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10hardshrinkERKN3c106ScalarE";

      function hardshrink_backward
        (this : access constant Tensor;
         grad_out : access constant Tensor;
         lambd : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3333
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19hardshrink_backwardERKS0_RKN3c106ScalarE";

      function rsqrt (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3338
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5rsqrtEv";

      function rsqrt_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3343
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6rsqrt_Ev";

      function c_select
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3348
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6selectENS_7DimnameEl";

      function c_select
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3353
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6selectEll";

      function select_symint
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3358
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13select_symintElN3c106SymIntE";

      function sigmoid (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3363
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7sigmoidEv";

      function sigmoid_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3368
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8sigmoid_Ev";

      function logit (this : access constant Tensor; eps : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3373
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5logitESt8optionalIdE";

      function logit_u (this : access constant Tensor; eps : cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3378
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6logit_ESt8optionalIdE";

      function sin (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3383
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3sinEv";

      function sin_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3388
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sin_Ev";

      function sinc (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3393
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sincEv";

      function sinc_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3398
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5sinc_Ev";

      function sinh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3403
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sinhEv";

      function sinh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3408
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5sinh_Ev";

      function detach (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3413
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6detachEv";

      function detach_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3418
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7detach_Ev";

      function size (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3423
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sizeENS_7DimnameE";

      function slice
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : cpp_14_2_0_optional.Class_optional.optional;
         c_end : cpp_14_2_0_optional.Class_optional.optional;
         step : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3428
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5sliceElSt8optionalIlES2_l";

      function slice_symint
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : access cpp_14_2_0_optional.Class_optional.optional;
         c_end : access cpp_14_2_0_optional.Class_optional.optional;
         step : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3433
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12slice_symintElSt8optionalIN3c106SymIntEES4_S3_";

      function slice_inverse
        (this : access constant Tensor;
         src : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : cpp_14_2_0_optional.Class_optional.optional;
         c_end : cpp_14_2_0_optional.Class_optional.optional;
         step : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3438
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13slice_inverseERKS0_lSt8optionalIlES4_l";

      function slice_inverse_symint
        (this : access constant Tensor;
         src : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : access cpp_14_2_0_optional.Class_optional.optional;
         c_end : access cpp_14_2_0_optional.Class_optional.optional;
         step : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3443
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor20slice_inverse_symintERKS0_lSt8optionalIN3c106SymIntEES6_S5_";

      function slice_scatter
        (this : access constant Tensor;
         src : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : cpp_14_2_0_optional.Class_optional.optional;
         c_end : cpp_14_2_0_optional.Class_optional.optional;
         step : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3448
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13slice_scatterERKS0_lSt8optionalIlES4_l";

      function slice_scatter_symint
        (this : access constant Tensor;
         src : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         start : access cpp_14_2_0_optional.Class_optional.optional;
         c_end : access cpp_14_2_0_optional.Class_optional.optional;
         step : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3453
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor20slice_scatter_symintERKS0_lSt8optionalIN3c106SymIntEES6_S5_";

      function select_scatter
        (this : access constant Tensor;
         src : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3458
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14select_scatterERKS0_ll";

      function select_scatter_symint
        (this : access constant Tensor;
         src : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access c10_core_SymInt_h.Class_SymInt.SymInt) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3463
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor21select_scatter_symintERKS0_lN3c106SymIntE";

      function diagonal_scatter
        (this : access constant Tensor;
         src : access constant Tensor;
         offset : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim2 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3468
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16diagonal_scatterERKS0_lll";

      function as_strided_scatter
        (this : access constant Tensor;
         src : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         stride : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         storage_offset : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3473
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18as_strided_scatterERKS0_N3c108ArrayRefIlEES5_St8optionalIlE";

      function as_strided_scatter_symint
        (this : access constant Tensor;
         src : access constant Tensor;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         stride : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         storage_offset : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3478
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor25as_strided_scatter_symintERKS0_N3c108ArrayRefINS3_6SymIntEEES6_St8optionalIS5_E";

      function smm (this : access constant Tensor; mat2 : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3483
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3smmERKS0_";

      function softmax
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3488
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7softmaxElSt8optionalIN3c1010ScalarTypeEE";

      function softmax
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3493
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7softmaxENS_7DimnameESt8optionalIN3c1010ScalarTypeEE";

      function unsafe_split
        (this : access constant Tensor;
         split_size : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3498
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12unsafe_splitEll";

      function unsafe_split_symint
        (this : access constant Tensor;
         split_size : access c10_core_SymInt_h.Class_SymInt.SymInt;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3503
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19unsafe_split_symintEN3c106SymIntEl";

      function split
        (this : access constant Tensor;
         split_size : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3508
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5splitEll";

      function split_symint
        (this : access constant Tensor;
         split_size : access c10_core_SymInt_h.Class_SymInt.SymInt;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3513
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12split_symintEN3c106SymIntEl";

      function split
        (this : access constant Tensor;
         split_size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3518
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5splitEN3c108ArrayRefIlEEl";

      function split_symint
        (this : access constant Tensor;
         split_size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3523
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12split_symintEN3c108ArrayRefINS1_6SymIntEEEl";

      function unsafe_split_with_sizes
        (this : access constant Tensor;
         split_sizes : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3528
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor23unsafe_split_with_sizesEN3c108ArrayRefIlEEl";

      function unsafe_split_with_sizes_symint
        (this : access constant Tensor;
         split_sizes : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3533
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor30unsafe_split_with_sizes_symintEN3c108ArrayRefINS1_6SymIntEEEl";

      function split_with_sizes
        (this : access constant Tensor;
         split_sizes : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3538
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16split_with_sizesEN3c108ArrayRefIlEEl";

      function split_with_sizes_symint
        (this : access constant Tensor;
         split_sizes : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3543
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor23split_with_sizes_symintEN3c108ArrayRefINS1_6SymIntEEEl";

      function hsplit (this : access constant Tensor; sections : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3548
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6hsplitEl";

      function hsplit (this : access constant Tensor; indices : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3553
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6hsplitEN3c108ArrayRefIlEE";

      function vsplit (this : access constant Tensor; sections : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3558
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6vsplitEl";

      function vsplit (this : access constant Tensor; indices : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3563
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6vsplitEN3c108ArrayRefIlEE";

      function dsplit (this : access constant Tensor; sections : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3568
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6dsplitEl";

      function dsplit (this : access constant Tensor; indices : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3573
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6dsplitEN3c108ArrayRefIlEE";

      function squeeze (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3578
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7squeezeEv";

      function squeeze (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3583
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7squeezeEl";

      function squeeze (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3588
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7squeezeENS_7DimnameE";

      function squeeze (this : access constant Tensor; dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3593
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7squeezeEN3c108ArrayRefIlEE";

      function squeeze_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3598
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8squeeze_Ev";

      function squeeze_u (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3603
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8squeeze_El";

      function squeeze_u (this : access constant Tensor; dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3608
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8squeeze_EN3c108ArrayRefIlEE";

      function squeeze_u (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3613
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8squeeze_ENS_7DimnameE";

      function sspaddmm
        (this : access constant Tensor;
         mat1 : access constant Tensor;
         mat2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3618
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8sspaddmmERKS0_S2_RKN3c106ScalarES6_";

      function stft
        (this : access constant Tensor;
         n_fft : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         hop_length : cpp_14_2_0_optional.Class_optional.optional;
         win_length : cpp_14_2_0_optional.Class_optional.optional;
         window : access constant cpp_14_2_0_optional.Class_optional.optional;
         normalized : Extensions.bool;
         onesided : cpp_14_2_0_optional.Class_optional.optional;
         return_complex : cpp_14_2_0_optional.Class_optional.optional;
         align_to_window : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3623
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4stftElSt8optionalIlES2_RKS1_IS0_EbS1_IbES6_S6_";

      function stft
        (this : access constant Tensor;
         n_fft : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         hop_length : cpp_14_2_0_optional.Class_optional.optional;
         win_length : cpp_14_2_0_optional.Class_optional.optional;
         window : access constant cpp_14_2_0_optional.Class_optional.optional;
         center : Extensions.bool;
         pad_mode : c10_util_string_view_h.Class_string_view.string_view;
         normalized : Extensions.bool;
         onesided : cpp_14_2_0_optional.Class_optional.optional;
         return_complex : cpp_14_2_0_optional.Class_optional.optional;
         align_to_window : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3628
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4stftElSt8optionalIlES2_RKS1_IS0_EbSt17basic_string_viewIcSt11char_traitsIcEEbS1_IbESA_SA_";

      function istft
        (this : access constant Tensor;
         n_fft : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         hop_length : cpp_14_2_0_optional.Class_optional.optional;
         win_length : cpp_14_2_0_optional.Class_optional.optional;
         window : access constant cpp_14_2_0_optional.Class_optional.optional;
         center : Extensions.bool;
         normalized : Extensions.bool;
         onesided : cpp_14_2_0_optional.Class_optional.optional;
         length : cpp_14_2_0_optional.Class_optional.optional;
         return_complex : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3633
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5istftElSt8optionalIlES2_RKS1_IS0_EbbS1_IbES2_b";

      function stride (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3638
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6strideENS_7DimnameE";

      function sum (this : access constant Tensor; dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3643
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3sumESt8optionalIN3c1010ScalarTypeEE";

      function sum
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3648
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3sumEN3c1016OptionalArrayRefIlEEbSt8optionalINS1_10ScalarTypeEE";

      function sum
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3653
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3sumEN3c108ArrayRefINS_7DimnameEEEbSt8optionalINS1_10ScalarTypeEE";

      function nansum
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3658
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6nansumEN3c1016OptionalArrayRefIlEEbSt8optionalINS1_10ScalarTypeEE";

      function sum_to_size (this : access constant Tensor; size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3663
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11sum_to_sizeEN3c108ArrayRefIlEE";

      function sum_to_size_symint (this : access constant Tensor; size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3668
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18sum_to_size_symintEN3c108ArrayRefINS1_6SymIntEEE";

      function sqrt (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3673
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sqrtEv";

      function sqrt_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3678
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5sqrt_Ev";

      function square (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3683
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6squareEv";

      function square_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3688
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7square_Ev";

      function std (this : access constant Tensor; unbiased : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3693
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3stdEb";

      function std
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         unbiased : Extensions.bool;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3698
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3stdEN3c1016OptionalArrayRefIlEEbb";

      function std
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         correction : access constant cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3703
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3stdEN3c1016OptionalArrayRefIlEERKSt8optionalINS1_6ScalarEEb";

      function std
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         unbiased : Extensions.bool;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3708
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3stdEN3c108ArrayRefINS_7DimnameEEEbb";

      function std
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         correction : access constant cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3713
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3stdEN3c108ArrayRefINS_7DimnameEEERKSt8optionalINS1_6ScalarEEb";

      function prod (this : access constant Tensor; dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3718
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4prodESt8optionalIN3c1010ScalarTypeEE";

      function prod
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3723
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4prodElbSt8optionalIN3c1010ScalarTypeEE";

      function prod
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         keepdim : Extensions.bool;
         dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3728
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4prodENS_7DimnameEbSt8optionalIN3c1010ScalarTypeEE";

      function t (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3733
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor1tEv";

      function t_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3738
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2t_Ev";

      function tan (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3743
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3tanEv";

      function tan_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3748
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4tan_Ev";

      function tanh (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3753
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4tanhEv";

      function tanh_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3758
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5tanh_Ev";

      function tile (this : access constant Tensor; dims : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3763
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4tileEN3c108ArrayRefIlEE";

      function tile_symint (this : access constant Tensor; dims : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3768
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11tile_symintEN3c108ArrayRefINS1_6SymIntEEE";

      function transpose
        (this : access constant Tensor;
         dim0 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3773
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9transposeEll";

      function transpose
        (this : access constant Tensor;
         dim0 : ATen_core_Dimname_h.Class_Dimname.Dimname;
         dim1 : ATen_core_Dimname_h.Class_Dimname.Dimname) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3778
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9transposeENS_7DimnameES1_";

      function transpose_u
        (this : access constant Tensor;
         dim0 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3783
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10transpose_Ell";

      function flip (this : access constant Tensor; dims : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3788
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4flipEN3c108ArrayRefIlEE";

      function fliplr (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3793
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6fliplrEv";

      function flipud (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3798
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6flipudEv";

      function roll
        (this : access constant Tensor;
         shifts : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dims : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3803
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4rollEN3c108ArrayRefIlEES3_";

      function roll_symint
        (this : access constant Tensor;
         shifts : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         dims : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3808
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11roll_symintEN3c108ArrayRefINS1_6SymIntEEENS2_IlEE";

      function rot90
        (this : access constant Tensor;
         k : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dims : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3813
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5rot90ElN3c108ArrayRefIlEE";

      --  skipped func _nested_tensor_size

      --  skipped func _nested_tensor_strides

      --  skipped func _nested_tensor_storage_offsets

      function trunc (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3833
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5truncEv";

      function trunc_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3838
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6trunc_Ev";

      function fix (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3843
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3fixEv";

      function fix_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3848
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4fix_Ev";

      function type_as (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3853
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7type_asERKS0_";

      function unsqueeze (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3858
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9unsqueezeEl";

      function unsqueeze_u (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3863
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10unsqueeze_El";

      function var (this : access constant Tensor; unbiased : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3868
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3varEb";

      function var
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         unbiased : Extensions.bool;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3873
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3varEN3c1016OptionalArrayRefIlEEbb";

      function var
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         correction : access constant cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3878
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3varEN3c1016OptionalArrayRefIlEERKSt8optionalINS1_6ScalarEEb";

      function var
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         unbiased : Extensions.bool;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3883
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3varEN3c108ArrayRefINS_7DimnameEEEbb";

      function var
        (this : access constant Tensor;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         correction : access constant cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3888
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3varEN3c108ArrayRefINS_7DimnameEEERKSt8optionalINS1_6ScalarEEb";

      function view_as (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3893
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7view_asERKS0_";

      function where
        (this : access constant Tensor;
         condition : access constant Tensor;
         other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3898
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5whereERKS0_S2_";

      function where
        (this : access constant Tensor;
         condition : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3903
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5whereERKS0_RKN3c106ScalarE";

      function norm
        (this : access constant Tensor;
         p : access constant cpp_14_2_0_optional.Class_optional.optional;
         dtype : c10_core_ScalarType_h.ScalarType) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3908
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4normERKSt8optionalIN3c106ScalarEENS2_10ScalarTypeE";

      function norm (this : access constant Tensor; p : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3913
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4normERKN3c106ScalarE";

      function norm
        (this : access constant Tensor;
         p : access constant cpp_14_2_0_optional.Class_optional.optional;
         dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         keepdim : Extensions.bool;
         dtype : c10_core_ScalarType_h.ScalarType) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3918
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4normERKSt8optionalIN3c106ScalarEENS2_8ArrayRefIlEEbNS2_10ScalarTypeE";

      function norm
        (this : access constant Tensor;
         p : access constant cpp_14_2_0_optional.Class_optional.optional;
         dim : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3923
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4normERKSt8optionalIN3c106ScalarEENS2_8ArrayRefIlEEb";

      function norm
        (this : access constant Tensor;
         p : access constant cpp_14_2_0_optional.Class_optional.optional;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         keepdim : Extensions.bool;
         dtype : c10_core_ScalarType_h.ScalarType) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3928
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4normERKSt8optionalIN3c106ScalarEENS2_8ArrayRefINS_7DimnameEEEbNS2_10ScalarTypeE";

      function norm
        (this : access constant Tensor;
         p : access constant cpp_14_2_0_optional.Class_optional.optional;
         dim : ATen_core_ATen_fwd_h.Class_DimnameList.DimnameList;
         keepdim : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3933
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4normERKSt8optionalIN3c106ScalarEENS2_8ArrayRefINS_7DimnameEEEb";

      function frexp (this : access constant Tensor) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3938
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5frexpEv";

      function clone (this : access constant Tensor; memory_format : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3943
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5cloneESt8optionalIN3c1012MemoryFormatEE";

      function positive (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3948
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8positiveEv";

      function resize_as_u
        (this : access constant Tensor;
         the_template : access constant Tensor;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3953
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10resize_as_ERKS0_St8optionalIN3c1012MemoryFormatEE";

      function resize_as_sparse_u (this : access constant Tensor; the_template : access constant Tensor) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3958
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor17resize_as_sparse_ERKS0_";

      function zero_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3963
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5zero_Ev";

      function sub
        (this : access constant Tensor;
         other : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3968
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3subERKS0_RKN3c106ScalarE";

      function sub_u
        (this : access constant Tensor;
         other : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3973
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sub_ERKS0_RKN3c106ScalarE";

      function sub
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3978
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3subERKN3c106ScalarES4_";

      function sub_u
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3983
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sub_ERKN3c106ScalarES4_";

      function subtract
        (this : access constant Tensor;
         other : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3988
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8subtractERKS0_RKN3c106ScalarE";

      function subtract_u
        (this : access constant Tensor;
         other : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3993
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9subtract_ERKS0_RKN3c106ScalarE";

      function subtract
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:3998
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8subtractERKN3c106ScalarES4_";

      function subtract_u
        (this : access constant Tensor;
         other : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4003
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9subtract_ERKN3c106ScalarES4_";

      function heaviside (this : access constant Tensor; values : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4008
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9heavisideERKS0_";

      function heaviside_u (this : access constant Tensor; values : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4013
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10heaviside_ERKS0_";

      function addmm
        (this : access constant Tensor;
         mat1 : access constant Tensor;
         mat2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4018
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5addmmERKS0_S2_RKN3c106ScalarES6_";

      function addmm_u
        (this : access constant Tensor;
         mat1 : access constant Tensor;
         mat2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4023
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6addmm_ERKS0_S2_RKN3c106ScalarES6_";

      --  skipped func _addmm_activation

      function sparse_resize_u
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         sparse_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dense_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4033
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14sparse_resize_EN3c108ArrayRefIlEEll";

      function sparse_resize_and_clear_u
        (this : access constant Tensor;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         sparse_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dense_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4038
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor24sparse_resize_and_clear_EN3c108ArrayRefIlEEll";

      function sparse_mask (this : access constant Tensor; mask : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4043
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11sparse_maskERKS0_";

      --  skipped func _sparse_mask_projection

      function to_dense
        (this : access constant Tensor;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         masked_grad : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4053
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8to_denseESt8optionalIN3c1010ScalarTypeEES1_IbE";

      --  skipped func _to_dense

      function sparse_dim (this : access constant Tensor) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4063
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10sparse_dimEv";

      --  skipped func _dimI

      function dense_dim (this : access constant Tensor) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4073
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9dense_dimEv";

      --  skipped func _dimV

      --  skipped func _nnz

      function coalesce (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4088
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8coalesceEv";

      function is_coalesced (this : access constant Tensor) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4093
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12is_coalescedEv";

      --  skipped func _indices

      --  skipped func _values

      --  skipped func _coalesced_

      function indices (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4113
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7indicesEv";

      function values (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4118
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6valuesEv";

      function crow_indices (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4123
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12crow_indicesEv";

      function col_indices (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4128
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11col_indicesEv";

      function ccol_indices (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4133
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12ccol_indicesEv";

      function row_indices (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4138
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11row_indicesEv";

      function unbind (this : access constant Tensor; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4143
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6unbindEl";

      function unbind (this : access constant Tensor; dim : ATen_core_Dimname_h.Class_Dimname.Dimname) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4148
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6unbindENS_7DimnameE";

      function to_sparse (this : access constant Tensor; sparse_dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4153
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9to_sparseEl";

      --  skipped func _to_sparse

      function to_sparse
        (this : access constant Tensor;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         blocksize : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef;
         dense_dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4163
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9to_sparseESt8optionalIN3c106LayoutEENS2_16OptionalArrayRefIlEES1_IlE";

      --  skipped func _to_sparse

      function to_sparse_csr (this : access constant Tensor; dense_dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4173
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13to_sparse_csrESt8optionalIlE";

      --  skipped func _to_sparse_csr

      function to_sparse_csc (this : access constant Tensor; dense_dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4183
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13to_sparse_cscESt8optionalIlE";

      --  skipped func _to_sparse_csc

      function to_sparse_bsr
        (this : access constant Tensor;
         blocksize : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dense_dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4193
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13to_sparse_bsrEN3c108ArrayRefIlEESt8optionalIlE";

      --  skipped func _to_sparse_bsr

      function to_sparse_bsc
        (this : access constant Tensor;
         blocksize : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         dense_dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4203
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13to_sparse_bscEN3c108ArrayRefIlEESt8optionalIlE";

      --  skipped func _to_sparse_bsc

      function to_mkldnn (this : access constant Tensor; dtype : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4213
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9to_mkldnnESt8optionalIN3c1010ScalarTypeEE";

      function dequantize (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4218
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10dequantizeEv";

      function q_scale (this : access constant Tensor) return double  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4223
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7q_scaleEv";

      function q_zero_point (this : access constant Tensor) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4228
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12q_zero_pointEv";

      function q_per_channel_scales (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4233
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor20q_per_channel_scalesEv";

      function q_per_channel_zero_points (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4238
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor25q_per_channel_zero_pointsEv";

      function q_per_channel_axis (this : access constant Tensor) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4243
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18q_per_channel_axisEv";

      function int_repr (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4248
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8int_reprEv";

      function qscheme (this : access constant Tensor) return c10_core_QScheme_h.QScheme  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4253
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7qschemeEv";

      --  skipped func _autocast_to_reduced_precision

      --  skipped func _autocast_to_full_precision

      function to
        (this : access constant Tensor;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions;
         non_blocking : Extensions.bool;
         copy : Extensions.bool;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4268
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2toEN3c1013TensorOptionsEbbSt8optionalINS1_12MemoryFormatEE";

      function to
        (this : access constant Tensor;
         dtype : cpp_14_2_0_optional.Class_optional.optional;
         layout : cpp_14_2_0_optional.Class_optional.optional;
         device : cpp_14_2_0_optional.Class_optional.optional;
         pin_memory : cpp_14_2_0_optional.Class_optional.optional;
         non_blocking : Extensions.bool;
         copy : Extensions.bool;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4273
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2toESt8optionalIN3c1010ScalarTypeEES1_INS2_6LayoutEES1_INS2_6DeviceEES1_IbEbbS1_INS2_12MemoryFormatEE";

      function to
        (this : access constant Tensor;
         the_device : c10_core_Device_h.Class_Device.Device;
         dtype : c10_core_ScalarType_h.ScalarType;
         non_blocking : Extensions.bool;
         copy : Extensions.bool;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4278
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2toEN3c106DeviceENS1_10ScalarTypeEbbSt8optionalINS1_12MemoryFormatEE";

      function to
        (this : access constant Tensor;
         dtype : c10_core_ScalarType_h.ScalarType;
         non_blocking : Extensions.bool;
         copy : Extensions.bool;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4283
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2toEN3c1010ScalarTypeEbbSt8optionalINS1_12MemoryFormatEE";

      function to
        (this : access constant Tensor;
         other : access constant Tensor;
         non_blocking : Extensions.bool;
         copy : Extensions.bool;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4288
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2toERKS0_bbSt8optionalIN3c1012MemoryFormatEE";

      function item (this : access constant Tensor) return c10_core_Scalar_h.Class_Scalar.Scalar  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4293
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4itemEv";

      function set_u (this : access constant Tensor; source : access c10_core_Storage_h.Class_Storage.Storage) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4298
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4set_EN3c107StorageE";

      function set_u
        (this : access constant Tensor;
         source : access c10_core_Storage_h.Class_Storage.Storage;
         storage_offset : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         stride : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4303
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4set_EN3c107StorageElNS1_8ArrayRefIlEES4_";

      function set_u_symint
        (this : access constant Tensor;
         source : access c10_core_Storage_h.Class_Storage.Storage;
         storage_offset : access c10_core_SymInt_h.Class_SymInt.SymInt;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         stride : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4308
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11set__symintEN3c107StorageENS1_6SymIntENS1_8ArrayRefIS3_EES5_";

      function set_u
        (this : access constant Tensor;
         source : access constant Tensor;
         storage_offset : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef;
         stride : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4313
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4set_ERKS0_lN3c108ArrayRefIlEES5_";

      function set_u_symint
        (this : access constant Tensor;
         source : access constant Tensor;
         storage_offset : access c10_core_SymInt_h.Class_SymInt.SymInt;
         size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef;
         stride : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4318
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11set__symintERKS0_N3c106SymIntENS3_8ArrayRefIS4_EES6_";

      function set_u (this : access constant Tensor; source : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4323
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4set_ERKS0_";

      function set_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4328
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4set_Ev";

      function is_set_to (this : access constant Tensor; tensor : access constant Tensor) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4333
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9is_set_toERKS0_";

      function masked_fill_u
        (this : access constant Tensor;
         mask : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4338
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12masked_fill_ERKS0_RKN3c106ScalarE";

      function masked_fill
        (this : access constant Tensor;
         mask : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4343
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11masked_fillERKS0_RKN3c106ScalarE";

      function masked_fill_u
        (this : access constant Tensor;
         mask : access constant Tensor;
         value : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4348
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12masked_fill_ERKS0_S2_";

      function masked_fill
        (this : access constant Tensor;
         mask : access constant Tensor;
         value : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4353
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11masked_fillERKS0_S2_";

      function masked_scatter_u
        (this : access constant Tensor;
         mask : access constant Tensor;
         source : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4358
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15masked_scatter_ERKS0_S2_";

      function masked_scatter
        (this : access constant Tensor;
         mask : access constant Tensor;
         source : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4363
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14masked_scatterERKS0_S2_";

      function view (this : access constant Tensor; size : ATen_core_ATen_fwd_h.Class_IntArrayRef.IntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4368
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4viewEN3c108ArrayRefIlEE";

      function view_symint (this : access constant Tensor; size : c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4373
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11view_symintEN3c108ArrayRefINS1_6SymIntEEE";

      function view (this : access constant Tensor; dtype : c10_core_ScalarType_h.ScalarType) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4378
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4viewEN3c1010ScalarTypeE";

      function put_u
        (this : access constant Tensor;
         index : access constant Tensor;
         source : access constant Tensor;
         accumulate : Extensions.bool) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4383
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4put_ERKS0_S2_b";

      function put
        (this : access constant Tensor;
         index : access constant Tensor;
         source : access constant Tensor;
         accumulate : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4388
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3putERKS0_S2_b";

      function index_add_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         source : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4393
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_add_ElRKS0_S2_RKN3c106ScalarE";

      function index_add
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         source : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4398
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9index_addElRKS0_S2_RKN3c106ScalarE";

      function index_add
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         source : access constant Tensor;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4403
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9index_addENS_7DimnameERKS0_S3_RKN3c106ScalarE";

      function index_reduce_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         source : access constant Tensor;
         reduce : c10_util_string_view_h.Class_string_view.string_view;
         include_self : Extensions.bool) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4408
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13index_reduce_ElRKS0_S2_St17basic_string_viewIcSt11char_traitsIcEEb";

      function index_reduce
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         source : access constant Tensor;
         reduce : c10_util_string_view_h.Class_string_view.string_view;
         include_self : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4413
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12index_reduceElRKS0_S2_St17basic_string_viewIcSt11char_traitsIcEEb";

      function index_fill_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4418
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11index_fill_ElRKS0_RKN3c106ScalarE";

      function index_fill
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4423
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_fillElRKS0_RKN3c106ScalarE";

      function index_fill_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4428
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11index_fill_ElRKS0_S2_";

      function index_fill
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4433
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_fillElRKS0_S2_";

      function index_fill_u
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4438
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11index_fill_ENS_7DimnameERKS0_RKN3c106ScalarE";

      function index_fill_u
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         value : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4443
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11index_fill_ENS_7DimnameERKS0_S3_";

      function index_fill
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4448
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_fillENS_7DimnameERKS0_RKN3c106ScalarE";

      function index_fill
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         value : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4453
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10index_fillENS_7DimnameERKS0_S3_";

      function scatter
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4458
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7scatterElRKS0_S2_";

      function scatter_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4463
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8scatter_ElRKS0_S2_";

      function scatter
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4468
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7scatterElRKS0_RKN3c106ScalarE";

      function scatter_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4473
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8scatter_ElRKS0_RKN3c106ScalarE";

      function scatter
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor;
         reduce : c10_util_string_view_h.Class_string_view.string_view) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4478
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7scatterElRKS0_S2_St17basic_string_viewIcSt11char_traitsIcEE";

      function scatter_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor;
         reduce : c10_util_string_view_h.Class_string_view.string_view) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4483
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8scatter_ElRKS0_S2_St17basic_string_viewIcSt11char_traitsIcEE";

      function scatter
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         reduce : c10_util_string_view_h.Class_string_view.string_view) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4488
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7scatterElRKS0_RKN3c106ScalarESt17basic_string_viewIcSt11char_traitsIcEE";

      function scatter_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         reduce : c10_util_string_view_h.Class_string_view.string_view) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4493
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8scatter_ElRKS0_RKN3c106ScalarESt17basic_string_viewIcSt11char_traitsIcEE";

      function scatter
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         src : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4498
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7scatterENS_7DimnameERKS0_S3_";

      function scatter
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4503
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7scatterENS_7DimnameERKS0_RKN3c106ScalarE";

      function scatter_add
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4508
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11scatter_addElRKS0_S2_";

      function scatter_add_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4513
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12scatter_add_ElRKS0_S2_";

      function scatter_add
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         src : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4518
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11scatter_addENS_7DimnameERKS0_S3_";

      function scatter_reduce
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor;
         reduce : c10_util_string_view_h.Class_string_view.string_view;
         include_self : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4523
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14scatter_reduceElRKS0_S2_St17basic_string_viewIcSt11char_traitsIcEEb";

      function scatter_reduce_u
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         src : access constant Tensor;
         reduce : c10_util_string_view_h.Class_string_view.string_view;
         include_self : Extensions.bool) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4528
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor15scatter_reduce_ElRKS0_S2_St17basic_string_viewIcSt11char_traitsIcEEb";

      function eq_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4533
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3eq_ERKN3c106ScalarE";

      function eq_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4538
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3eq_ERKS0_";

      function bitwise_and (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4543
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11bitwise_andERKN3c106ScalarE";

      function bitwise_and (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4548
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11bitwise_andERKS0_";

      function bitwise_and_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4553
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12bitwise_and_ERKN3c106ScalarE";

      function bitwise_and_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4558
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12bitwise_and_ERKS0_";

      --  skipped func __and__

      --  skipped func __and__

      --  skipped func __iand__

      --  skipped func __iand__

      function bitwise_or (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4583
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10bitwise_orERKN3c106ScalarE";

      function bitwise_or (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4588
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10bitwise_orERKS0_";

      function bitwise_or_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4593
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11bitwise_or_ERKN3c106ScalarE";

      function bitwise_or_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4598
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11bitwise_or_ERKS0_";

      --  skipped func __or__

      --  skipped func __or__

      --  skipped func __ior__

      --  skipped func __ior__

      function bitwise_xor (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4623
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11bitwise_xorERKN3c106ScalarE";

      function bitwise_xor (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4628
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11bitwise_xorERKS0_";

      function bitwise_xor_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4633
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12bitwise_xor_ERKN3c106ScalarE";

      function bitwise_xor_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4638
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12bitwise_xor_ERKS0_";

      --  skipped func __xor__

      --  skipped func __xor__

      --  skipped func __ixor__

      --  skipped func __ixor__

      --  skipped func __lshift__

      --  skipped func __lshift__

      --  skipped func __ilshift__

      --  skipped func __ilshift__

      function bitwise_left_shift (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4683
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18bitwise_left_shiftERKS0_";

      function bitwise_left_shift_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4688
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19bitwise_left_shift_ERKS0_";

      function bitwise_left_shift (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4693
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18bitwise_left_shiftERKN3c106ScalarE";

      function bitwise_left_shift_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4698
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19bitwise_left_shift_ERKN3c106ScalarE";

      --  skipped func __rshift__

      --  skipped func __rshift__

      --  skipped func __irshift__

      --  skipped func __irshift__

      function bitwise_right_shift (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4723
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19bitwise_right_shiftERKS0_";

      function bitwise_right_shift_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4728
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor20bitwise_right_shift_ERKS0_";

      function bitwise_right_shift (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4733
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor19bitwise_right_shiftERKN3c106ScalarE";

      function bitwise_right_shift_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4738
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor20bitwise_right_shift_ERKN3c106ScalarE";

      function tril_u (this : access constant Tensor; diagonal : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4743
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5tril_El";

      function triu_u (this : access constant Tensor; diagonal : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4748
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5triu_El";

      function digamma_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4753
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8digamma_Ev";

      function lerp_u
        (this : access constant Tensor;
         c_end : access constant Tensor;
         weight : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4758
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5lerp_ERKS0_RKN3c106ScalarE";

      function lerp_u
        (this : access constant Tensor;
         c_end : access constant Tensor;
         weight : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4763
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5lerp_ERKS0_S2_";

      function addbmm_u
        (this : access constant Tensor;
         batch1 : access constant Tensor;
         batch2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4768
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7addbmm_ERKS0_S2_RKN3c106ScalarES6_";

      function addbmm
        (this : access constant Tensor;
         batch1 : access constant Tensor;
         batch2 : access constant Tensor;
         beta : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         alpha : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4773
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6addbmmERKS0_S2_RKN3c106ScalarES6_";

      function random_u
        (this : access constant Tensor;
         from : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         to : cpp_14_2_0_optional.Class_optional.optional;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4778
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7random_ElSt8optionalIlES1_INS_9GeneratorEE";

      function random_u
        (this : access constant Tensor;
         to : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4783
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7random_ElSt8optionalINS_9GeneratorEE";

      function random_u (this : access constant Tensor; generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4788
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7random_ESt8optionalINS_9GeneratorEE";

      function uniform_u
        (this : access constant Tensor;
         from : double;
         to : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4793
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8uniform_EddSt8optionalINS_9GeneratorEE";

      function cauchy_u
        (this : access constant Tensor;
         median : double;
         sigma : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4798
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7cauchy_EddSt8optionalINS_9GeneratorEE";

      function log_normal_u
        (this : access constant Tensor;
         mean : double;
         std : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4803
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11log_normal_EddSt8optionalINS_9GeneratorEE";

      function exponential_u
        (this : access constant Tensor;
         lambd : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4808
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12exponential_EdSt8optionalINS_9GeneratorEE";

      function geometric_u
        (this : access constant Tensor;
         p : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4813
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10geometric_EdSt8optionalINS_9GeneratorEE";

      function diag (this : access constant Tensor; diagonal : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4818
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4diagEl";

      function cross
        (this : access constant Tensor;
         other : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4823
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5crossERKS0_St8optionalIlE";

      function triu (this : access constant Tensor; diagonal : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4828
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4triuEl";

      function tril (this : access constant Tensor; diagonal : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4833
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4trilEl";

      function trace (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4838
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5traceEv";

      function ne (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4843
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2neERKN3c106ScalarE";

      function ne (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4848
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2neERKS0_";

      function ne_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4853
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3ne_ERKN3c106ScalarE";

      function ne_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4858
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3ne_ERKS0_";

      function not_equal (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4863
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9not_equalERKN3c106ScalarE";

      function not_equal (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4868
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9not_equalERKS0_";

      function not_equal_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4873
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10not_equal_ERKN3c106ScalarE";

      function not_equal_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4878
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10not_equal_ERKS0_";

      function eq (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4883
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2eqERKN3c106ScalarE";

      function eq (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4888
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2eqERKS0_";

      function ge (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4893
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2geERKN3c106ScalarE";

      function ge (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4898
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2geERKS0_";

      function ge_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4903
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3ge_ERKN3c106ScalarE";

      function ge_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4908
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3ge_ERKS0_";

      function greater_equal (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4913
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13greater_equalERKN3c106ScalarE";

      function greater_equal (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4918
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13greater_equalERKS0_";

      function greater_equal_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4923
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14greater_equal_ERKN3c106ScalarE";

      function greater_equal_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4928
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14greater_equal_ERKS0_";

      function le (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4933
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2leERKN3c106ScalarE";

      function le (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4938
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2leERKS0_";

      function le_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4943
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3le_ERKN3c106ScalarE";

      function le_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4948
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3le_ERKS0_";

      function less_equal (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4953
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10less_equalERKN3c106ScalarE";

      function less_equal (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4958
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10less_equalERKS0_";

      function less_equal_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4963
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11less_equal_ERKN3c106ScalarE";

      function less_equal_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4968
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11less_equal_ERKS0_";

      function gt (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4973
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2gtERKN3c106ScalarE";

      function gt (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4978
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2gtERKS0_";

      function gt_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4983
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3gt_ERKN3c106ScalarE";

      function gt_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4988
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3gt_ERKS0_";

      function greater (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4993
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7greaterERKN3c106ScalarE";

      function greater (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:4998
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7greaterERKS0_";

      function greater_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5003
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8greater_ERKN3c106ScalarE";

      function greater_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5008
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8greater_ERKS0_";

      function lt (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5013
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2ltERKN3c106ScalarE";

      function lt (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5018
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2ltERKS0_";

      function lt_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5023
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3lt_ERKN3c106ScalarE";

      function lt_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5028
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3lt_ERKS0_";

      function less (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5033
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4lessERKN3c106ScalarE";

      function less (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5038
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4lessERKS0_";

      function less_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5043
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5less_ERKN3c106ScalarE";

      function less_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5048
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5less_ERKS0_";

      function take (this : access constant Tensor; index : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5053
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4takeERKS0_";

      function take_along_dim
        (this : access constant Tensor;
         indices : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5058
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14take_along_dimERKS0_St8optionalIlE";

      function index_select
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5063
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12index_selectElRKS0_";

      function index_select
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5068
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12index_selectENS_7DimnameERKS0_";

      function masked_select (this : access constant Tensor; mask : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5073
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13masked_selectERKS0_";

      function nonzero (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5078
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7nonzeroEv";

      function nonzero_static
        (this : access constant Tensor;
         size : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         fill_value : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5083
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14nonzero_staticEll";

      function nonzero_static_symint
        (this : access constant Tensor;
         size : access c10_core_SymInt_h.Class_SymInt.SymInt;
         fill_value : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5088
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor21nonzero_static_symintEN3c106SymIntEl";

      function nonzero_numpy (this : access constant Tensor) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5093
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13nonzero_numpyEv";

      function argwhere (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5098
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8argwhereEv";

      function gather
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         index : access constant Tensor;
         sparse_grad : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5103
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6gatherElRKS0_b";

      function gather
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         index : access constant Tensor;
         sparse_grad : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5108
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6gatherENS_7DimnameERKS0_b";

      function addcmul
        (this : access constant Tensor;
         tensor1 : access constant Tensor;
         tensor2 : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5113
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7addcmulERKS0_S2_RKN3c106ScalarE";

      function addcmul_u
        (this : access constant Tensor;
         tensor1 : access constant Tensor;
         tensor2 : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5118
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8addcmul_ERKS0_S2_RKN3c106ScalarE";

      function addcdiv
        (this : access constant Tensor;
         tensor1 : access constant Tensor;
         tensor2 : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5123
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7addcdivERKS0_S2_RKN3c106ScalarE";

      function addcdiv_u
        (this : access constant Tensor;
         tensor1 : access constant Tensor;
         tensor2 : access constant Tensor;
         value : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5128
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8addcdiv_ERKS0_S2_RKN3c106ScalarE";

      function triangular_solve
        (this : access constant Tensor;
         A : access constant Tensor;
         upper : Extensions.bool;
         transpose : Extensions.bool;
         unitriangular : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5133
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16triangular_solveERKS0_bbb";

      function svd
        (this : access constant Tensor;
         some : Extensions.bool;
         compute_uv : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5138
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3svdEbb";

      function swapaxes
        (this : access constant Tensor;
         axis0 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         axis1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5143
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8swapaxesEll";

      function swapaxes_u
        (this : access constant Tensor;
         axis0 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         axis1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5148
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9swapaxes_Ell";

      function swapdims
        (this : access constant Tensor;
         dim0 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5153
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8swapdimsEll";

      function swapdims_u
        (this : access constant Tensor;
         dim0 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim1 : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5158
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9swapdims_Ell";

      function cholesky (this : access constant Tensor; upper : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5163
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8choleskyEb";

      function cholesky_solve
        (this : access constant Tensor;
         input2 : access constant Tensor;
         upper : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5168
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14cholesky_solveERKS0_b";

      function cholesky_inverse (this : access constant Tensor; upper : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5173
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16cholesky_inverseEb";

      function qr (this : access constant Tensor; some : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5178
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2qrEb";

      function geqrf (this : access constant Tensor) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5183
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5geqrfEv";

      function orgqr (this : access constant Tensor; input2 : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5188
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5orgqrERKS0_";

      function ormqr
        (this : access constant Tensor;
         input2 : access constant Tensor;
         input3 : access constant Tensor;
         left : Extensions.bool;
         transpose : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5193
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5ormqrERKS0_S2_bb";

      function lu_solve
        (this : access constant Tensor;
         LU_data : access constant Tensor;
         LU_pivots : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5198
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8lu_solveERKS0_S2_";

      function multinomial
        (this : access constant Tensor;
         num_samples : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         replacement : Extensions.bool;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5203
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11multinomialElbSt8optionalINS_9GeneratorEE";

      function multinomial_symint
        (this : access constant Tensor;
         num_samples : access c10_core_SymInt_h.Class_SymInt.SymInt;
         replacement : Extensions.bool;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5208
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor18multinomial_symintEN3c106SymIntEbSt8optionalINS_9GeneratorEE";

      function lgamma_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5213
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7lgamma_Ev";

      function lgamma (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5218
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6lgammaEv";

      function digamma (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5223
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7digammaEv";

      function polygamma (this : access constant Tensor; n : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5228
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9polygammaEl";

      function polygamma_u (this : access constant Tensor; n : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5233
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10polygamma_El";

      function erfinv (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5238
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6erfinvEv";

      function erfinv_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5243
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7erfinv_Ev";

      function i0 (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5248
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2i0Ev";

      function i0_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5253
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3i0_Ev";

      function sign (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5258
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4signEv";

      function sign_u (this : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5263
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5sign_Ev";

      function signbit (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5268
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7signbitEv";

      function dist
        (this : access constant Tensor;
         other : access constant Tensor;
         p : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5273
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4distERKS0_RKN3c106ScalarE";

      function atan2_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5278
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6atan2_ERKS0_";

      function atan2 (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5283
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5atan2ERKS0_";

      function arctan2 (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5288
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7arctan2ERKS0_";

      function arctan2_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5293
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8arctan2_ERKS0_";

      function lerp
        (this : access constant Tensor;
         c_end : access constant Tensor;
         weight : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5298
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4lerpERKS0_RKN3c106ScalarE";

      function lerp
        (this : access constant Tensor;
         c_end : access constant Tensor;
         weight : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5303
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4lerpERKS0_S2_";

      function histc
        (this : access constant Tensor;
         bins : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         min : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         max : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5308
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5histcElRKN3c106ScalarES4_";

      function histogram
        (this : access constant Tensor;
         bins : access constant Tensor;
         weight : access constant cpp_14_2_0_optional.Class_optional.optional;
         density : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5313
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9histogramERKS0_RKSt8optionalIS0_Eb";

      function histogram
        (this : access constant Tensor;
         bins : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         c_range : cpp_14_2_0_optional.Class_optional.optional;
         weight : access constant cpp_14_2_0_optional.Class_optional.optional;
         density : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5318
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9histogramElSt8optionalIN3c108ArrayRefIdEEERKS1_IS0_Eb";

      function fmod (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5323
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4fmodERKN3c106ScalarE";

      function fmod_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5328
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5fmod_ERKN3c106ScalarE";

      function fmod (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5333
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4fmodERKS0_";

      function fmod_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5338
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5fmod_ERKS0_";

      function hypot (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5343
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5hypotERKS0_";

      function hypot_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5348
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6hypot_ERKS0_";

      function igamma (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5353
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6igammaERKS0_";

      function igamma_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5358
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7igamma_ERKS0_";

      function igammac (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5363
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7igammacERKS0_";

      function igammac_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5368
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8igammac_ERKS0_";

      function nextafter (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5373
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9nextafterERKS0_";

      function nextafter_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5378
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10nextafter_ERKS0_";

      function remainder (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5383
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9remainderERKN3c106ScalarE";

      function remainder_u (this : access constant Tensor; other : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5388
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10remainder_ERKN3c106ScalarE";

      function remainder (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5393
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor9remainderERKS0_";

      function remainder_u (this : access constant Tensor; other : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5398
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor10remainder_ERKS0_";

      function min (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5403
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3minEv";

      function fmin (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5408
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4fminERKS0_";

      function max (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5413
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3maxEv";

      function fmax (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5418
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4fmaxERKS0_";

      function maximum (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5423
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7maximumERKS0_";

      function max (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5428
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3maxERKS0_";

      function minimum (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5433
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7minimumERKS0_";

      function min (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5438
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3minERKS0_";

      function quantile
        (this : access constant Tensor;
         q : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool;
         interpolation : c10_util_string_view_h.Class_string_view.string_view) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5443
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8quantileERKS0_St8optionalIlEbSt17basic_string_viewIcSt11char_traitsIcEE";

      function quantile
        (this : access constant Tensor;
         q : double;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool;
         interpolation : c10_util_string_view_h.Class_string_view.string_view) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5448
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8quantileEdSt8optionalIlEbSt17basic_string_viewIcSt11char_traitsIcEE";

      function nanquantile
        (this : access constant Tensor;
         q : access constant Tensor;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool;
         interpolation : c10_util_string_view_h.Class_string_view.string_view) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5453
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11nanquantileERKS0_St8optionalIlEbSt17basic_string_viewIcSt11char_traitsIcEE";

      function nanquantile
        (this : access constant Tensor;
         q : double;
         dim : cpp_14_2_0_optional.Class_optional.optional;
         keepdim : Extensions.bool;
         interpolation : c10_util_string_view_h.Class_string_view.string_view) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5458
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11nanquantileEdSt8optionalIlEbSt17basic_string_viewIcSt11char_traitsIcEE";

      function sort
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         descending : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5463
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sortElb";

      function sort
        (this : access constant Tensor;
         stable : cpp_14_2_0_optional.Class_optional.optional;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         descending : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5468
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sortESt8optionalIbElb";

      function sort
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         descending : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5473
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sortENS_7DimnameEb";

      function sort
        (this : access constant Tensor;
         stable : cpp_14_2_0_optional.Class_optional.optional;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         descending : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5478
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4sortESt8optionalIbENS_7DimnameEb";

      function msort (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5483
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5msortEv";

      function argsort
        (this : access constant Tensor;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         descending : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5488
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7argsortElb";

      function argsort
        (this : access constant Tensor;
         stable : Extensions.bool;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         descending : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5493
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7argsortEblb";

      function argsort
        (this : access constant Tensor;
         dim : ATen_core_Dimname_h.Class_Dimname.Dimname;
         descending : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5498
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7argsortENS_7DimnameEb";

      function topk
        (this : access constant Tensor;
         k : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         largest : Extensions.bool;
         sorted : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5503
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4topkEllbb";

      function topk_symint
        (this : access constant Tensor;
         k : access c10_core_SymInt_h.Class_SymInt.SymInt;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         largest : Extensions.bool;
         sorted : Extensions.bool) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5508
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11topk_symintEN3c106SymIntElbb";

      function c_all (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5513
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3allEv";

      function any (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5518
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3anyEv";

      function renorm
        (this : access constant Tensor;
         p : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         maxnorm : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5523
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6renormERKN3c106ScalarElS4_";

      function renorm_u
        (this : access constant Tensor;
         p : access constant c10_core_Scalar_h.Class_Scalar.Scalar;
         dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         maxnorm : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5528
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7renorm_ERKN3c106ScalarElS4_";

      function unfold
        (this : access constant Tensor;
         dimension : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         size : x86_64_linux_gnu_bits_stdint_intn_h.int64_t;
         step : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5533
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6unfoldElll";

      function equal (this : access constant Tensor; other : access constant Tensor) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5538
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5equalERKS0_";

      function pow (this : access constant Tensor; exponent : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5543
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3powERKS0_";

      function pow (this : access constant Tensor; exponent : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5548
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3powERKN3c106ScalarE";

      function pow_u (this : access constant Tensor; exponent : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5553
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4pow_ERKN3c106ScalarE";

      function pow_u (this : access constant Tensor; exponent : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5558
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4pow_ERKS0_";

      function float_power (this : access constant Tensor; exponent : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5563
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11float_powerERKS0_";

      function float_power (this : access constant Tensor; exponent : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5568
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11float_powerERKN3c106ScalarE";

      function float_power_u (this : access constant Tensor; exponent : access constant c10_core_Scalar_h.Class_Scalar.Scalar) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5573
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12float_power_ERKN3c106ScalarE";

      function float_power_u (this : access constant Tensor; exponent : access constant Tensor) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5578
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor12float_power_ERKS0_";

      function normal_u
        (this : access constant Tensor;
         mean : double;
         std : double;
         generator : access cpp_14_2_0_optional.Class_optional.optional) return access Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5583
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7normal_EddSt8optionalINS_9GeneratorEE";

      function alias (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5588
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5aliasEv";

      function isfinite (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5593
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8isfiniteEv";

      function isinf (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5598
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5isinfEv";

      procedure record_stream (this : access constant Tensor; s : Stream)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5603
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13record_streamEN3c106StreamE";

      function isposinf (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5608
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8isposinfEv";

      function isneginf (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5613
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor8isneginfEv";

      function det (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5618
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3detEv";

      function slogdet (this : access constant Tensor) return cpp_14_2_0_tuple.Class_tuple.tuple  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5623
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7slogdetEv";

      function logdet (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5628
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor6logdetEv";

      function inverse (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5633
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor7inverseEv";

      function inner (this : access constant Tensor; other : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5638
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5innerERKS0_";

      function outer (this : access constant Tensor; vec2 : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5643
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor5outerERKS0_";

      function ger (this : access constant Tensor; vec2 : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5648
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3gerERKS0_";

      function to_padded_tensor
        (this : access constant Tensor;
         padding : double;
         output_size : ATen_core_ATen_fwd_h.Class_OptionalIntArrayRef.OptionalIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5653
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor16to_padded_tensorEdN3c1016OptionalArrayRefIlEE";

      function to_padded_tensor_symint
        (this : access constant Tensor;
         padding : double;
         output_size : ATen_core_ATen_fwd_h.Class_OptionalSymIntArrayRef.OptionalSymIntArrayRef) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5658
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor23to_padded_tensor_symintEdN3c1016OptionalArrayRefINS1_6SymIntEEE";

      function var (this : access constant Tensor; dim : int) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1361
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3varEi";

      function std (this : access constant Tensor; dim : int) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1365
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor3stdEi";

      function to
        (this : access constant Tensor;
         type_meta : c10_util_typeid_h.Class_TypeMeta.TypeMeta;
         non_blocking : Extensions.bool;
         copy : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1374
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2toEN6caffe28TypeMetaEbb";

      function to
        (this : access constant Tensor;
         the_device : c10_core_Device_h.Class_Device.Device;
         type_meta : c10_util_typeid_h.Class_TypeMeta.TypeMeta;
         non_blocking : Extensions.bool;
         copy : Extensions.bool) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1377
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor2toEN3c106DeviceEN6caffe28TypeMetaEbb";

      function tensor_data (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1394
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor11tensor_dataEv";

      function variable_data (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1409
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor13variable_dataEv";

      function data (this : access constant Tensor) return Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1459
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor4dataEv";

      --  skipped func _backward

      function requires_grad_u (this : access constant Tensor; u_requires_grad : Extensions.bool) return access constant Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:1465
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at6Tensor14requires_grad_Eb";
   end;
   use Class_Tensor;
   function borrow_from_optional_tensor (opt : access constant cpp_14_2_0_optional.Class_optional.optional) return c10_util_MaybeOwned_h.Class_MaybeOwned.MaybeOwned  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBody.h:5747
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN2at27borrow_from_optional_tensorERKSt8optionalINS_6TensorEE";

end ATen_core_TensorBody_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
