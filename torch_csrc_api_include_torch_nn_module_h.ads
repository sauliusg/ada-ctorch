pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with cpp_14_2_0_bits_shared_ptr_h;
with torch_csrc_api_include_torch_ordered_dict_h;
with cpp_14_2_0_optional;
with Interfaces.C.Extensions;
with cpp_14_2_0_bits_stringfwd_h;
limited with cpp_14_2_0_bits_basic_string_h;
with cpp_14_2_0_bits_stl_vector_h;
with c10_core_Device_h;
with torch_csrc_api_include_torch_types_h;
limited with torch_csrc_api_include_torch_serialize_output_archive_h;
limited with torch_csrc_api_include_torch_serialize_input_archive_h;
limited with cpp_14_2_0_ostream;
with ATen_core_TensorBody_h;

package torch_csrc_api_include_torch_nn_module_h is

   package Class_Module is
      type Module is tagged limited record
         parent : aliased cpp_14_2_0_bits_shared_ptr_h.Class_enable_shared_from_this.enable_shared_from_this;
         parameters_u : aliased torch_csrc_api_include_torch_ordered_dict_h.Class_OrderedDict.OrderedDict;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:552
         buffers_u : aliased torch_csrc_api_include_torch_ordered_dict_h.Class_OrderedDict.OrderedDict;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:600
         children_u : aliased torch_csrc_api_include_torch_ordered_dict_h.Class_OrderedDict.OrderedDict;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:603
         name_u : aliased cpp_14_2_0_optional.Class_optional.optional;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:606
         is_training_u : aliased Extensions.bool;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:609
      end record
      with Import => True,
           Convention => CPP;

      function New_Module (name : cpp_14_2_0_bits_stringfwd_h.Class_string.string) return Module;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:77
      pragma CPP_Constructor (New_Module, "_ZN5torch2nn6ModuleC1ENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE");

      function New_Module return Module;  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:82
      pragma CPP_Constructor (New_Module, "_ZN5torch2nn6ModuleC1Ev");

      function Assign_Module (this : access Module'Class; arg2 : access constant Module'Class) return access Module  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:84
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6ModuleaSERKS1_";

      function Assign_Module (this : access Module'Class; arg2 : access Module'Class) return access Module  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:86
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6ModuleaSEOS1_";

      procedure Delete_Module (this : access Module)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:88
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6ModuleD1Ev";

      procedure Delete_And_Free_Module (this : access Module)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:88
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6ModuleD0Ev";

      function name (this : access constant Module'Class) return access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:99
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module4nameB5cxx11Ev";

      function clone (this : access constant Module; device : access constant cpp_14_2_0_optional.Class_optional.optional) return cpp_14_2_0_bits_shared_ptr_h.Class_shared_ptr.shared_ptr  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:117
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module5cloneERKSt8optionalIN3c106DeviceEE";

      procedure apply (this : access Module'Class; c_function : access constant ModuleApplyFunction)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:130
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module5applyERKSt8functionIFvRS1_EE";

      procedure apply (this : access constant Module'Class; c_function : access constant ConstModuleApplyFunction)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:142
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module5applyERKSt8functionIFvRKS1_EE";

      procedure apply
        (this : access Module'Class;
         c_function : access constant NamedModuleApplyFunction;
         name_prefix : access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:157
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module5applyERKSt8functionIFvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERS1_EESA_";

      procedure apply
        (this : access constant Module'Class;
         c_function : access constant ConstNamedModuleApplyFunction;
         name_prefix : access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:174
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module5applyERKSt8functionIFvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKS1_EESA_";

      procedure apply (this : access constant Module'Class; c_function : access constant ModulePointerApplyFunction)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:188
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module5applyERKSt8functionIFvRKSt10shared_ptrIS1_EEE";

      procedure apply
        (this : access constant Module'Class;
         c_function : access constant NamedModulePointerApplyFunction;
         name_prefix : access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:205
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module5applyERKSt8functionIFvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKSt10shared_ptrIS1_EEESA_";

      function parameters (this : access constant Module'Class; recurse : Extensions.bool) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:211
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module10parametersEb";

      function named_parameters (this : access constant Module'Class; recurse : Extensions.bool) return torch_csrc_api_include_torch_ordered_dict_h.Class_OrderedDict.OrderedDict  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:215
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module16named_parametersB5cxx11Eb";

      function buffers (this : access constant Module'Class; recurse : Extensions.bool) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:219
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module7buffersEb";

      function named_buffers (this : access constant Module'Class; recurse : Extensions.bool) return torch_csrc_api_include_torch_ordered_dict_h.Class_OrderedDict.OrderedDict  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:223
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module13named_buffersB5cxx11Eb";

      function modules (this : access constant Module'Class; include_self : Extensions.bool) return cpp_14_2_0_bits_stl_vector_h.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:236
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module7modulesEb";

      function named_modules
        (this : access constant Module'Class;
         name_prefix : access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string;
         include_self : Extensions.bool) return torch_csrc_api_include_torch_ordered_dict_h.Class_OrderedDict.OrderedDict  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:251
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module13named_modulesERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb";

      function children (this : access constant Module'Class) return cpp_14_2_0_bits_stl_vector_h.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:256
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module8childrenEv";

      function named_children (this : access constant Module'Class) return torch_csrc_api_include_torch_ordered_dict_h.Class_OrderedDict.OrderedDict  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:260
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module14named_childrenB5cxx11Ev";

      procedure train (this : access Module; on : Extensions.bool)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:263
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module5trainEb";

      procedure eval (this : access Module'Class)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:267
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module4evalEv";

      function is_training (this : access constant Module) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:278
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module11is_trainingEv";

      procedure to
        (this : access Module;
         the_device : c10_core_Device_h.Class_Device.Device;
         the_dtype : torch_csrc_api_include_torch_types_h.Dtype;
         non_blocking : Extensions.bool)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:286
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module2toEN3c106DeviceENS2_10ScalarTypeEb";

      procedure to
        (this : access Module;
         the_dtype : torch_csrc_api_include_torch_types_h.Dtype;
         non_blocking : Extensions.bool)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:297
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module2toEN3c1010ScalarTypeEb";

      procedure to
        (this : access Module;
         the_device : c10_core_Device_h.Class_Device.Device;
         non_blocking : Extensions.bool)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:305
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module2toEN3c106DeviceEb";

      procedure zero_grad (this : access Module; set_to_none : Extensions.bool)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:308
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module9zero_gradEb";

      procedure save (this : access constant Module; archive : access torch_csrc_api_include_torch_serialize_output_archive_h.Class_OutputArchive.OutputArchive)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:393
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module4saveERNS_9serialize13OutputArchiveE";

      procedure load (this : access Module; archive : access torch_csrc_api_include_torch_serialize_input_archive_h.Class_InputArchive.InputArchive)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:400
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module4loadERNS_9serialize12InputArchiveE";

      procedure pretty_print (this : access constant Module; stream : access cpp_14_2_0_ostream.Class_basic_ostream.basic_ostream'Class)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:409
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module12pretty_printERSo";

      function is_serializable (this : access constant Module) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:412
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module15is_serializableEv";

      function register_parameter
        (this : access Module'Class;
         name : cpp_14_2_0_bits_stringfwd_h.Class_string.string;
         the_tensor : ATen_core_TensorBody_h.Class_Tensor.Tensor;
         requires_grad : Extensions.bool) return access ATen_core_TensorBody_h.Class_Tensor.Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:431
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module18register_parameterENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEN2at6TensorEb";

      function register_buffer
        (this : access Module'Class;
         name : cpp_14_2_0_bits_stringfwd_h.Class_string.string;
         the_tensor : ATen_core_TensorBody_h.Class_Tensor.Tensor) return access ATen_core_TensorBody_h.Class_Tensor.Tensor  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:449
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module15register_bufferENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEN2at6TensorE";

      procedure unregister_module (this : access Module'Class; name : access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:521
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module17unregister_moduleERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE";

      function u_forward_has_default_args (this : access Module) return Extensions.bool  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:528
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module25_forward_has_default_argsEv";

      function u_forward_num_required_args (this : access Module) return unsigned  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:532
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module26_forward_num_required_argsEv";

      function u_forward_populate_default_args (this : access Module; arguments : access cpp_14_2_0_bits_stl_vector_h.Class_vector.vector) return cpp_14_2_0_bits_stl_vector_h.Class_vector.vector  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:540
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module30_forward_populate_default_argsEOSt6vectorINS0_8AnyValueESaIS3_EE";

      procedure clone_u
        (this : access Module;
         other : access Module'Class;
         device : access constant cpp_14_2_0_optional.Class_optional.optional)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:579
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN5torch2nn6Module6clone_ERS1_RKSt8optionalIN3c106DeviceEE";

      procedure pretty_print_recursive
        (this : access constant Module'Class;
         stream : access cpp_14_2_0_ostream.Class_basic_ostream.basic_ostream'Class;
         indentation : access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:586
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module22pretty_print_recursiveERSoRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE";

      procedure apply_to_submodules
        (this : access constant Module'Class;
         c_function : access constant NamedModulePointerApplyFunction;
         name_prefix : access constant cpp_14_2_0_bits_basic_string_h.Class_basic_string.basic_string)  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:592
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module19apply_to_submodulesERKSt8functionIFvRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKSt10shared_ptrIS1_EEESA_";

      function shared_from_this_checked (this : access constant Module'Class) return cpp_14_2_0_bits_shared_ptr_h.Class_shared_ptr.shared_ptr  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:597
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK5torch2nn6Module24shared_from_this_checkedEv";
   end;
   use Class_Module;
   function operator_sl (stream : access cpp_14_2_0_ostream.Class_basic_ostream.basic_ostream'Class; module : access constant Module'Class) return access cpp_14_2_0_ostream.Class_basic_ostream.basic_ostream  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:564
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN5torch2nnlsERSoRKNS0_6ModuleE";

   function operator_sl (archive : access torch_csrc_api_include_torch_serialize_output_archive_h.Class_OutputArchive.OutputArchive; module : access constant cpp_14_2_0_bits_shared_ptr_h.Class_shared_ptr.shared_ptr) return access torch_csrc_api_include_torch_serialize_output_archive_h.Class_OutputArchive.OutputArchive  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:613
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN5torch2nnlsERNS_9serialize13OutputArchiveERKSt10shared_ptrINS0_6ModuleEE";

   function operator_sr (archive : access torch_csrc_api_include_torch_serialize_input_archive_h.Class_InputArchive.InputArchive; module : access constant cpp_14_2_0_bits_shared_ptr_h.Class_shared_ptr.shared_ptr) return access torch_csrc_api_include_torch_serialize_input_archive_h.Class_InputArchive.InputArchive  -- /home/saulius/install/pytorch/pytorch-main-commit-d3d655ad14e/include/torch/csrc/api/include/torch/nn/module.h:618
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN5torch2nnrsERNS_9serialize12InputArchiveERKSt10shared_ptrINS0_6ModuleEE";

end torch_csrc_api_include_torch_nn_module_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
