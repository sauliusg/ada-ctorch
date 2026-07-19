// Uses:
#include <torch/torch.h>
#include <tensors.h>

#include <ada-shadow-iterator.hpp> // For AdaShadowIteratorHolder

#include <ada_c_error_codes.h>
#include <ada_c_error_code_helpers.h>

extern "C" {

    // Dataset batch interface:

    struct AdaShadowBatch {
        torch::data::Example<> batch;

        AdaShadowBatch(torch::data::Example<>& b):
            batch(b) {};
    };

    AdaShadowBatch*
    new_ada_shadow_batch_from_iterator(AdaShadowIteratorHolder* h)
    {
        assert(h);
        return new (std::nothrow) AdaShadowBatch(*(h->it));
    }

    void
    delete_ada_shadow_batch(AdaShadowBatch *shadow)
    {
        delete shadow;
    }

    AdaShadowBatch*
    clone_ada_shadow_batch(AdaShadowBatch *shadow)
    {
        assert(shadow);
        return new (std::nothrow) AdaShadowBatch(shadow->batch);
    }

    AdaShadowTensor*
    new_AdaShadowTensor_batch_data(AdaShadowBatch *shadow)
    {
        assert(shadow);
        return new (std::nothrow) AdaShadowTensor(shadow->batch.data);
    }
    
    AdaShadowTensor*
    new_AdaShadowTensor_batch_target(AdaShadowBatch *shadow)
    {
        assert(shadow);
        return new (std::nothrow) AdaShadowTensor(shadow->batch.target);
    }
    
} // extern "C" {
