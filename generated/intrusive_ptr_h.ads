pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with cpp_14_2_0_atomic;
with System;
with cpp_14_2_0_bits_unique_ptr_h;
with Interfaces.C.Extensions;

package intrusive_ptr_h is

   type DontIncreaseRefcount is record
      null;
   end record
   with Convention => C_Pass_By_Copy;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:26

   kImpracticallyHugeReferenceCount : aliased constant x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:30
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c106detailL32kImpracticallyHugeReferenceCountE";

   package Class_intrusive_ptr_target is
      type intrusive_ptr_target is tagged limited record
         refcount_u : aliased cpp_14_2_0_atomic.Class_atomic.atomic;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:83
         weakcount_u : aliased cpp_14_2_0_atomic.Class_atomic.atomic;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:84
      end record
      with Import => True,
           Convention => CPP;

      procedure Delete_intrusive_ptr_target (this : access intrusive_ptr_target)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:101
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1020intrusive_ptr_targetD1Ev";

      procedure Delete_And_Free_intrusive_ptr_target (this : access intrusive_ptr_target)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:101
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1020intrusive_ptr_targetD0Ev";

      function New_intrusive_ptr_target return intrusive_ptr_target;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:147
      pragma CPP_Constructor (New_intrusive_ptr_target, "_ZN3c1020intrusive_ptr_targetC1Ev");

      function Assign_intrusive_ptr_target (this : access intrusive_ptr_target'Class; arg2 : access intrusive_ptr_target'Class) return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:155
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1020intrusive_ptr_targetaSEOS0_";

      function Assign_intrusive_ptr_target (this : access intrusive_ptr_target'Class; arg2 : access constant intrusive_ptr_target'Class) return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:162
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1020intrusive_ptr_targetaSERKS0_";

      procedure release_resources (this : access intrusive_ptr_target)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:179
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1020intrusive_ptr_target17release_resourcesEv";
   end;
   use Class_intrusive_ptr_target;
   package intrusive_ptr_intrusive_ptr_target_intrusive_target_default_null_type is
      type intrusive_ptr is limited record
         target_u : access intrusive_ptr_target;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:252
      end record
      with Import => True,
           Convention => CPP;

      procedure retain_u (this : access intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:270
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7retain_Ev";

      procedure reset_u (this : access intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:280
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE6reset_Ev";

      function New_intrusive_ptr (target : access intrusive_ptr_target) return intrusive_ptr;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:311
      pragma CPP_Constructor (New_intrusive_ptr, "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEC1EPS1_");

      function New_intrusive_ptr return intrusive_ptr;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:332
      pragma CPP_Constructor (New_intrusive_ptr, "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEC1Ev");

      function New_intrusive_ptr (arg1 : System.Address) return intrusive_ptr;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:335
      pragma CPP_Constructor (New_intrusive_ptr, "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEC1EDn");

      function New_intrusive_ptr (target : access intrusive_ptr_target; arg2 : DontIncreaseRefcount) return intrusive_ptr;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:341
      pragma CPP_Constructor (New_intrusive_ptr, "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEC1EPS1_NS_3raw20DontIncreaseRefcountE");

      function New_intrusive_ptr (rhs : cpp_14_2_0_bits_unique_ptr_h.unique_ptr) return intrusive_ptr;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:344
      pragma CPP_Constructor (New_intrusive_ptr, "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEC1ESt10unique_ptrIS1_St14default_deleteIS1_EE");

      procedure Delete_intrusive_ptr (this : access intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:376
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEED1Ev";

      function Assign_intrusive_ptr (this : access intrusive_ptr; rhs : access intrusive_ptr) return access intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:380
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEaSEOS5_";

      function Assign_intrusive_ptr (this : access intrusive_ptr; rhs : access constant intrusive_ptr) return access intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:398
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEaSERKS5_";

      function get (this : access constant intrusive_ptr) return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:414
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE3getEv";

      function operator_t (this : access constant intrusive_ptr) return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:418
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEdeEv";

      function operator__gt (this : access constant intrusive_ptr) return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:422
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEptEv";

      --  skipped func __conv_op 

      procedure reset (this : access intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:430
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE5resetEv";

      procedure swap (this : access intrusive_ptr; rhs : access intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:435
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE4swapERS5_";

      function defined (this : access constant intrusive_ptr) return Extensions.bool  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:440
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7definedEv";

      function use_count (this : access constant intrusive_ptr) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:444
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE9use_countEv";

      function weak_use_count (this : access constant intrusive_ptr) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:451
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE14weak_use_countEv";

      function unique (this : access constant intrusive_ptr) return Extensions.bool  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:458
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE6uniqueEv";

      function release (this : access intrusive_ptr) return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:469
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7releaseEv";

      function reclaim (owning_ptr : access intrusive_ptr_target'Class) return intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:482
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7reclaimEPS1_";

      function reclaim_copy (owning_ptr : access intrusive_ptr_target'Class) return intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:495
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE12reclaim_copyEPS1_";

      function unsafe_steal_from_new (raw_ptr : access intrusive_ptr_target'Class) return intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:521
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE21unsafe_steal_from_newEPS1_";

      function unsafe_adapt_non_heap_allocated (raw_ptr : access intrusive_ptr_target'Class; expected_decrefs : x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t) return intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:541
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE31unsafe_adapt_non_heap_allocatedEPS1_j";

      function unsafe_reclaim_from_nonowning (raw_ptr : access intrusive_ptr_target'Class) return intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:574
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1013intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE29unsafe_reclaim_from_nonowningEPS1_";

   end;
   use intrusive_ptr_intrusive_ptr_target_intrusive_target_default_null_type;



   package weak_intrusive_ptr_intrusive_ptr_target_intrusive_target_default_null_type is
      type weak_intrusive_ptr is limited record
         target_u : access intrusive_ptr_target;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:703
      end record
      with Import => True,
           Convention => CPP;

      procedure retain_u (this : access weak_intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:708
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7retain_Ev";

      procedure reset_u (this : access weak_intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:718
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE6reset_Ev";

      function New_weak_intrusive_ptr (target : access intrusive_ptr_target) return weak_intrusive_ptr;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:727
      pragma CPP_Constructor (New_weak_intrusive_ptr, "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEC1EPS1_");

      function New_weak_intrusive_ptr (ptr : access constant intrusive_ptr) return weak_intrusive_ptr;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:732
      pragma CPP_Constructor (New_weak_intrusive_ptr, "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEC1ERKNS_13intrusive_ptrIS1_S4_EE");

      procedure Delete_weak_intrusive_ptr (this : access weak_intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:768
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEED1Ev";

      function Assign_weak_intrusive_ptr (this : access weak_intrusive_ptr; rhs : access weak_intrusive_ptr) return access weak_intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:772
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEaSEOS5_";

      function Assign_weak_intrusive_ptr (this : access weak_intrusive_ptr; rhs : access constant weak_intrusive_ptr) return access weak_intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:788
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEaSERKS5_";

      function Assign_weak_intrusive_ptr (this : access weak_intrusive_ptr; rhs : access constant intrusive_ptr) return access weak_intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:796
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNR3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEEaSERKNS_13intrusive_ptrIS1_S4_EE";

      procedure reset (this : access weak_intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:814
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE5resetEv";

      procedure swap (this : access weak_intrusive_ptr; rhs : access weak_intrusive_ptr)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:818
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE4swapERS5_";

      --  skipped func _unsafe_get_target

      function use_count (this : access constant weak_intrusive_ptr) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:849
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE9use_countEv";

      function weak_use_count (this : access constant weak_intrusive_ptr) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:857
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE14weak_use_countEv";

      function expired (this : access constant weak_intrusive_ptr) return Extensions.bool  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:864
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7expiredEv";

      function lock (this : access constant weak_intrusive_ptr) return intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:868
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZNK3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE4lockEv";

      function release (this : access weak_intrusive_ptr) return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:894
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7releaseEv";

      function reclaim (owning_weak_ptr : access intrusive_ptr_target'Class) return weak_intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:907
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE7reclaimEPS1_";

      function reclaim_copy (owning_ptr : access intrusive_ptr_target'Class) return weak_intrusive_ptr  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:926
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c1018weak_intrusive_ptrINS_20intrusive_ptr_targetENS_6detail34intrusive_target_default_null_typeIS1_EEE12reclaim_copyEPS1_";

   end;
   use weak_intrusive_ptr_intrusive_ptr_target_intrusive_target_default_null_type;



   package intrusive_target_default_null_type_intrusive_ptr_target is
      type intrusive_target_default_null_type is limited record
         null;
      end record
      with Import => True,
           Convention => CPP;

      function singleton return access intrusive_ptr_target  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:185
      with Import => True, 
           Convention => CPP, 
           External_Name => "_ZN3c106detail34intrusive_target_default_null_typeINS_20intrusive_ptr_targetEE9singletonEv";

   end;
   use intrusive_target_default_null_type_intrusive_ptr_target;



   function atomic_refcount_increment (refcount : access cpp_14_2_0_atomic.Class_atomic.atomic) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:201
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c106detail25atomic_refcount_incrementERSt6atomicIjE";

   function atomic_weakcount_increment (weakcount : access cpp_14_2_0_atomic.Class_atomic.atomic) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:207
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c106detail26atomic_weakcount_incrementERSt6atomicIjE";

   function atomic_refcount_decrement (refcount : access cpp_14_2_0_atomic.Class_atomic.atomic) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:213
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c106detail25atomic_refcount_decrementERSt6atomicIjE";

   function atomic_weakcount_decrement (weakcount : access cpp_14_2_0_atomic.Class_atomic.atomic) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:217
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c106detail26atomic_weakcount_decrementERSt6atomicIjE";

   subtype weak_intrusive_ptr_target is intrusive_ptr_target;  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:973

   procedure incref (self : access intrusive_ptr_target'Class)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:993
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c103raw13intrusive_ptr6increfEPNS_20intrusive_ptr_targetE";

   procedure decref (self : access intrusive_ptr_target'Class)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:1001
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c103raw13intrusive_ptr6decrefEPNS_20intrusive_ptr_targetE";

   function use_count (self : access intrusive_ptr_target'Class) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:1017
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c103raw13intrusive_ptr9use_countEPNS_20intrusive_ptr_targetE";

   procedure incref (self : access weak_intrusive_ptr_target'Class)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:1028
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c103raw18weak_intrusive_ptr6increfEPNS_20intrusive_ptr_targetE";

   procedure decref (self : access weak_intrusive_ptr_target'Class)  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:1032
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c103raw18weak_intrusive_ptr6decrefEPNS_20intrusive_ptr_targetE";

   function use_count (self : access weak_intrusive_ptr_target'Class) return x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t  -- /home/saulius/src/pytorch/c10/util/intrusive_ptr.h:1048
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZN3c103raw18weak_intrusive_ptr9use_countEPNS_20intrusive_ptr_targetE";

end intrusive_ptr_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
