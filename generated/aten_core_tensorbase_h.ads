pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with c10_core_TensorImpl_h;
with Interfaces.C.Extensions;
with c10_util_intrusive_ptr_h;
with x86_64_linux_gnu_bits_stdint_intn_h;
with c10_core_MemoryFormat_h;
with c10_util_MaybeOwned_h;
with c10_core_TensorOptions_h;
with cpp_14_2_0_optional;
with c10_core_SymInt_h;
with stddef_h;
with cpp_14_2_0_bits_stringfwd_h;
with c10_util_ArrayRef_h;
with c10_core_SymIntArrayRef_h;
with ATen_core_Dimname_h;
with c10_core_DispatchKeySet_h;
with c10_core_ScalarType_h;
limited with c10_core_Storage_h;
with c10_core_Layout_h;
with c10_util_typeid_h;
with c10_core_Device_h;
with ATen_core_QuantizerBase_h;
limited with ATen_core_NamedTensor_h;
with System;
limited with cpp_14_2_0_bits_shared_ptr_h;
limited with cpp_14_2_0_bits_basic_string_h;
with c10_core_DispatchKey_h;

package ATen_core_TensorBase_h is

   type Scalar is null record;   -- incomplete struct

   type Node is null record;   -- incomplete struct

   function get_tensor_base (t : access constant c10_core_TensorImpl_h.Tensor) return access constant TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:43
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN2at15get_tensor_baseERKNS_6TensorE";

   function variable_excluded_from_dispatch return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:46
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN2at4impl31variable_excluded_from_dispatchEv";

   package Class_TensorBase is
      type unsafe_borrow_t is record
         null;
      end record
      with Convention => C_Pass_By_Copy;
      type TensorBase is limited record
         impl_u : aliased c10_util_intrusive_ptr_h.Class_intrusive_ptr.intrusive_ptr;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:918
      end record
      with Import => True,
           Convention => CPP;

      function New_TensorBase (arg1 : unsafe_borrow_t; rhs : access constant TensorBase) return TensorBase;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:90
      pragma CPP_Constructor (New_TensorBase, "_ZN2at10TensorBaseC1ENS0_15unsafe_borrow_tERKS0_");

      function New_TensorBase return TensorBase;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:95
      pragma CPP_Constructor (New_TensorBase, "_ZN2at10TensorBaseC1Ev");

      function New_TensorBase (tensor_impl : access c10_util_intrusive_ptr_h.Class_intrusive_ptr.intrusive_ptr) return TensorBase;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:98
      pragma CPP_Constructor (New_TensorBase, "_ZN2at10TensorBaseC1EN3c1013intrusive_ptrINS1_10TensorImplENS1_19UndefinedTensorImplEEE");

      procedure Delete_TensorBase (this : access TensorBase)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:107
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBaseD1Ev";

      function wrap_tensor_impl (tensor_impl : access c10_util_intrusive_ptr_h.Class_intrusive_ptr.intrusive_ptr) return TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:112
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBase16wrap_tensor_implEN3c1013intrusive_ptrINS1_10TensorImplENS1_19UndefinedTensorImplEEE";

      function dim (this : access constant TensorBase) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:119
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase3dimEv";

      function storage_offset (this : access constant TensorBase) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:122
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase14storage_offsetEv";

      function contiguous (this : access constant TensorBase; memory_format : c10_core_MemoryFormat_h.MemoryFormat) return TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:126
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase10contiguousEN3c1012MemoryFormatE";

      function expect_contiguous (this : access constant TensorBase; memory_format : c10_core_MemoryFormat_h.MemoryFormat) return c10_util_MaybeOwned_h.Class_MaybeOwned.MaybeOwned  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:1019
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNKR2at10TensorBase17expect_contiguousEN3c1012MemoryFormatE";

      function expect_contiguous (this : access TensorBase; memory_format : c10_core_MemoryFormat_h.MemoryFormat) return c10_util_MaybeOwned_h.Class_MaybeOwned.MaybeOwned  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:145
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNO2at10TensorBase17expect_contiguousEN3c1012MemoryFormatE";

      function fill_u (this : access constant TensorBase; scalar : access constant Scalar) return access constant TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:148
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5fill_ERKN3c106ScalarE";

      function zero_u (this : access constant TensorBase) return access constant TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:149
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5zero_Ev";

      function to
        (this : access constant TensorBase;
         options : c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions;
         non_blocking : Extensions.bool;
         copy : Extensions.bool;
         memory_format : cpp_14_2_0_optional.Class_optional.optional) return TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:151
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase2toEN3c1013TensorOptionsEbbSt8optionalINS1_12MemoryFormatEE";

      function is_complex (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:153
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase10is_complexEv";

      function is_floating_point (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:157
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase17is_floating_pointEv";

      function is_signed (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:161
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9is_signedEv";

      function sym_size (this : access constant TensorBase; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return c10_core_SymInt_h.Class_SymInt.SymInt  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:165
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase8sym_sizeEl";

      function sym_stride (this : access constant TensorBase; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return c10_core_SymInt_h.Class_SymInt.SymInt  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:169
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase10sym_strideEl";

      function size (this : access constant TensorBase; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:177
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase4sizeEl";

      function stride (this : access constant TensorBase; dim : x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:181
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6strideEl";

      function unsafeGetTensorImpl (this : access constant TensorBase) return access c10_core_TensorImpl_h.Class_TensorImpl.TensorImpl  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:188
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase19unsafeGetTensorImplEv";

      function unsafeReleaseTensorImpl (this : access TensorBase) return access c10_core_TensorImpl_h.Class_TensorImpl.TensorImpl  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:191
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBase23unsafeReleaseTensorImplEv";

      function getIntrusivePtr (this : access constant TensorBase) return access constant c10_util_intrusive_ptr_h.Class_intrusive_ptr.intrusive_ptr  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:194
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase15getIntrusivePtrEv";

      function unsafeReleaseIntrusivePtr (this : access TensorBase) return c10_util_intrusive_ptr_h.Class_intrusive_ptr.intrusive_ptr  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:198
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBase25unsafeReleaseIntrusivePtrEv";

      function defined (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:202
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7definedEv";

      procedure reset (this : access TensorBase)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:206
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBase5resetEv";

      function Assign_TensorBase (this : access TensorBase; x : access constant TensorBase) return access TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:220
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR2at10TensorBaseaSERKS0_";

      function Assign_TensorBase (this : access TensorBase; x : access TensorBase) return access TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:221
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR2at10TensorBaseaSEOS0_";

      function Assign_TensorBase (this : access TensorBase; arg2 : access constant TensorBase) return access TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:225
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNO2at10TensorBaseaSERKS0_";

      function Assign_TensorBase (this : access TensorBase; arg2 : access TensorBase) return access TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:226
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNO2at10TensorBaseaSEOS0_";

      function is_same (this : access constant TensorBase; other : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:228
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_sameERKS0_";

      function use_count (this : access constant TensorBase) return stddef_h.size_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:231
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9use_countEv";

      function weak_use_count (this : access constant TensorBase) return stddef_h.size_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:234
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase14weak_use_countEv";

      function toString (this : access constant TensorBase) return cpp_14_2_0_bits_stringfwd_h.Class_string.string  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:238
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase8toStringB5cxx11Ev";

      function sizes (this : access constant TensorBase) return c10_util_ArrayRef_h.Class_IntArrayRef.IntArrayRef  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:240
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5sizesEv";

      function sym_sizes (this : access constant TensorBase) return c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:243
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9sym_sizesEv";

      function sym_strides (this : access constant TensorBase) return c10_core_SymIntArrayRef_h.Class_SymIntArrayRef.SymIntArrayRef  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:246
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase11sym_stridesEv";

      function strides (this : access constant TensorBase) return c10_util_ArrayRef_h.Class_IntArrayRef.IntArrayRef  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:249
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7stridesEv";

      function opt_names (this : access constant TensorBase) return cpp_14_2_0_optional.Class_optional.optional  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:253
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9opt_namesEv";

      function names (this : access constant TensorBase) return ATen_core_Dimname_h.Class_DimnameList.DimnameList  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:257
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5namesEv";

      function ndimension (this : access constant TensorBase) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:260
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase10ndimensionEv";

      function is_contiguous (this : access constant TensorBase; memory_format : c10_core_MemoryFormat_h.MemoryFormat) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:264
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase13is_contiguousEN3c1012MemoryFormatE";

      function is_non_overlapping_and_dense (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:268
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase28is_non_overlapping_and_denseEv";

      function suggest_memory_format (this : access constant TensorBase; channels_last_strides_exact_match : Extensions.bool) return c10_core_MemoryFormat_h.MemoryFormat  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:272
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase21suggest_memory_formatEb";

      function nbytes (this : access constant TensorBase) return stddef_h.size_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:298
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6nbytesEv";

      function sym_nbytes (this : access constant TensorBase) return c10_core_SymInt_h.Class_SymInt.SymInt  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:306
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase10sym_nbytesEv";

      function numel (this : access constant TensorBase) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:314
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5numelEv";

      function sym_numel (this : access constant TensorBase) return c10_core_SymInt_h.Class_SymInt.SymInt  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:318
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9sym_numelEv";

      function sym_storage_offset (this : access constant TensorBase) return c10_core_SymInt_h.Class_SymInt.SymInt  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:322
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase18sym_storage_offsetEv";

      function itemsize (this : access constant TensorBase) return stddef_h.size_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:328
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase8itemsizeEv";

      function element_size (this : access constant TensorBase) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:333
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase12element_sizeEv";

      function key_set (this : access constant TensorBase) return c10_core_DispatchKeySet_h.Class_DispatchKeySet.DispatchKeySet  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:337
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7key_setEv";

      function scalar_type (this : access constant TensorBase) return c10_core_ScalarType_h.ScalarType  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:340
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase11scalar_typeEv";

      function has_storage (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:343
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase11has_storageEv";

      function storage (this : access constant TensorBase) return access constant c10_core_Storage_h.Class_Storage.Storage  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:346
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7storageEv";

      function is_alias_of (this : access constant TensorBase; other : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:349
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase11is_alias_ofERKS0_";

      procedure share_memory_u (this : access TensorBase)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:368
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBase13share_memory_Ev";

      --  skipped func _is_zerotensor

      --  skipped func _set_zero

      function is_conj (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:380
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_conjEv";

      --  skipped func _set_conj

      function is_neg (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:392
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_negEv";

      --  skipped func _set_neg

      function layout (this : access constant TensorBase) return c10_core_Layout_h.Layout  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:405
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6layoutEv";

      function dtype (this : access constant TensorBase) return c10_util_typeid_h.Class_TypeMeta.TypeMeta  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:410
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5dtypeEv";

      function device (this : access constant TensorBase) return c10_core_Device_h.Class_Device.Device  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:415
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6deviceEv";

      function get_device (this : access constant TensorBase) return c10_core_Device_h.DeviceIndex  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:420
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase10get_deviceEv";

      function is_cpu (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:426
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_cpuEv";

      function is_cuda (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:432
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_cudaEv";

      function is_ipu (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:438
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_ipuEv";

      function is_xpu (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:444
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_xpuEv";

      function is_xla (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:450
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_xlaEv";

      function is_mtia (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:455
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_mtiaEv";

      function is_hpu (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:460
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_hpuEv";

      function is_lazy (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:465
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_lazyEv";

      function is_hip (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:470
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_hipEv";

      function is_ve (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:476
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5is_veEv";

      function is_privateuseone (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:482
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase16is_privateuseoneEv";

      function is_sparse (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:488
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9is_sparseEv";

      function is_sparse_csr (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:494
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase13is_sparse_csrEv";

      function is_mkldnn (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:500
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9is_mkldnnEv";

      function is_mps (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:506
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase6is_mpsEv";

      function is_maia (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:512
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_maiaEv";

      function is_vulkan (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:518
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9is_vulkanEv";

      function is_metal (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:524
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase8is_metalEv";

      function is_quantized (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:530
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase12is_quantizedEv";

      function is_meta (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:537
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_metaEv";

      function is_inference (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:542
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase12is_inferenceEv";

      function is_nested (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:547
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9is_nestedEv";

      function quantizer (this : access constant TensorBase) return ATen_core_QuantizerBase_h.Class_QuantizerPtr.QuantizerPtr  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:553
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9quantizerEv";

      function has_names (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:556
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9has_namesEv";

      function get_named_tensor_meta (this : access constant TensorBase) return access constant ATen_core_NamedTensor_h.Class_NamedTensorMeta.NamedTensorMeta  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:566
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase21get_named_tensor_metaEv";

      function get_named_tensor_meta (this : access TensorBase) return access ATen_core_NamedTensor_h.Class_NamedTensorMeta.NamedTensorMeta  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:570
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBase21get_named_tensor_metaEv";

      function options (this : access constant TensorBase) return c10_core_TensorOptions_h.Class_TensorOptions.TensorOptions  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:576
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7optionsEv";

      function const_data_ptr (this : access constant TensorBase) return System.Address  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:582
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase14const_data_ptrEv";

      function mutable_data_ptr (this : access constant TensorBase) return System.Address  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:586
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase16mutable_data_ptrEv";

      function data_ptr (this : access constant TensorBase) return System.Address  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:594
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase8data_ptrEv";

      procedure print (this : access constant TensorBase)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:620
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase5printEv";

      function set_requires_grad (this : access constant TensorBase; requires_grad : Extensions.bool) return access constant TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:772
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase17set_requires_gradEb";

      function requires_grad (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:776
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase13requires_gradEv";

      --  skipped func _fw_grad

      --  skipped func _set_fw_grad

      function tensor_data (this : access constant TensorBase) return TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:804
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase11tensor_dataEv";

      function variable_data (this : access constant TensorBase) return TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:817
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase13variable_dataEv";

      function grad_fn (this : access constant TensorBase) return access constant cpp_14_2_0_bits_shared_ptr_h.shared_ptr  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:829
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7grad_fnEv";

      --  skipped func _register_hook

      procedure remove_hook (this : access constant TensorBase; pos : unsigned)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:880
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase11remove_hookEj";

      function is_leaf (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:885
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_leafEv";

      function output_nr (this : access constant TensorBase) return x86_64_linux_gnu_bits_stdint_intn_h.int64_t  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:887
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase9output_nrEv";

      procedure set_data (this : access constant TensorBase; new_data : access constant TensorBase)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:889
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase8set_dataERKS0_";

      function data (this : access constant TensorBase) return TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:891
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase4dataEv";

      --  skipped func _version

      procedure retain_grad (this : access constant TensorBase)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:895
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase11retain_gradEv";

      function retains_grad (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:897
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase12retains_gradEv";

      function requires_grad_u (this : access constant TensorBase; u_requires_grad : Extensions.bool) return access constant TensorBase  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:899
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase14requires_grad_Eb";

      function is_view (this : access constant TensorBase) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:905
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase7is_viewEv";

      --  skipped func _base

      function name (this : access constant TensorBase) return access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:914
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK2at10TensorBase4nameB5cxx11Ev";

      procedure enforce_invariants (this : access TensorBase)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:917
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN2at10TensorBase18enforce_invariantsEv";

      --  skipped func __dispatch_contiguous
   end;
   use Class_TensorBase;
   function get_device (self : access constant TensorBase) return c10_core_Device_h.DeviceIndex  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:924
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN2at10get_deviceERKNS_10TensorBaseE";

   function legacyExtractDispatchKey (t : access constant TensorBase) return c10_core_DispatchKey_h.DispatchKey  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:956
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN2at24legacyExtractDispatchKeyERKNS_10TensorBaseE";

   function borrow_from_optional_tensor (opt : access constant cpp_14_2_0_optional.Class_optional.optional) return c10_util_MaybeOwned_h.Class_MaybeOwned.MaybeOwned  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/ATen/core/TensorBase.h:1012
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN2at27borrow_from_optional_tensorERKSt8optionalINS_10TensorBaseEE";

end ATen_core_TensorBase_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
