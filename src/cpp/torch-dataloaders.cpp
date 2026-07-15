// Exports:
#include <torch-dataloaders.h>

// Uses:
#include <torch/torch.h>
#include <torch-datasets.h>
#include <ada_c_error_codes.h>
#include <tensors.h>

#include <ada_c_error_codes.h>
#include <ada_c_error_code_helpers.h>

extern "C" {

    // ---------------------------------------------------------------------------
    // Sequential MNIST sampler:
    
    struct AdaShadowMNISTDataLoaderSequentialSampler {
        mnist_data_loader_sequential_sampler_t dl;

        AdaShadowMNISTDataLoaderSequentialSampler(mnist_stacked_dataset_t* ds,
                                                  int64_t batch_size)
        {
            dl = torch::data::make_data_loader
                <torch::data::samplers::SequentialSampler>
                (std::move(*ds), batch_size);
        }
           
    };
    
    AdaShadowMNISTDataLoaderSequentialSampler*
    new_mnist_data_loader_sequential_sampler (mnist_stacked_dataset_t* ds,
                                              int64_t batch_size,
                                              ada_c_error_type *err)
    {
        try {
            return new AdaShadowMNISTDataLoaderSequentialSampler
                (ds, batch_size);
        }
        catch (c10::Error e) {
            char message [4096];
            snprintf (message, sizeof(message), "(%s \"%s\") - \"%s\"",
                      "forwarded from", __FUNCTION__,
                      e.what());
            message [sizeof(message) - 4] = '.';
            message [sizeof(message) - 3] = '.';
            message [sizeof(message) - 2] = '.';

            message [sizeof(message) - 1] = '\0';
            ada_set_error_code (err, 13);
            ada_set_error_message (err,  message);
            return NULL;
        }
    }

    void
    delete_mnist_data_loader_sequential_sampler
        (AdaShadowMNISTDataLoaderSequentialSampler* shadow)
    {
        delete shadow;
    }

    // ---------------------------------------------------------------------------
    // Default (random?) MNIST sampler:
    
    struct AdaShadowMNISTDataLoaderDefaultSampler {
        mnist_data_loader_default_sampler_t dl;

        AdaShadowMNISTDataLoaderDefaultSampler(mnist_stacked_dataset_t* ds,
                                               int64_t batch_size)
        {
            dl = torch::data::make_data_loader
                (std::move(*ds), batch_size);
        }
           
    };
    
    AdaShadowMNISTDataLoaderDefaultSampler*
    new_mnist_data_loader_default_sampler (mnist_stacked_dataset_t* ds,
                                           int64_t batch_size,
                                           ada_c_error_type *err)
    {
        try {
            return new AdaShadowMNISTDataLoaderDefaultSampler
                (ds, batch_size);
        }
        catch (c10::Error e) {
            char message [4096];
            snprintf (message, sizeof(message), "(%s \"%s\") - \"%s\"",
                      "forwarded from", __FUNCTION__,
                      e.what());
            message [sizeof(message) - 4] = '.';
            message [sizeof(message) - 3] = '.';
            message [sizeof(message) - 2] = '.';

            message [sizeof(message) - 1] = '\0';
            ada_set_error_code (err, 13);
            ada_set_error_message (err,  message);
            return NULL;
        }
    }

    void
    delete_mnist_data_loader_default_sampler
        (AdaShadowMNISTDataLoaderDefaultSampler* shadow)
    {
        delete shadow;
    }    

    // Iterator interface:

    typedef torch::data::Iterator<torch::data::Example<>> example_iterator_t;
    
    struct AdaShadowIteratorHolder {

        example_iterator_t it;

        AdaShadowIteratorHolder(const example_iterator_t& iter)
            : it(iter),
              refcount(1)
        {
        }

        void add_reference()
        {
            ++refcount;
        }

        bool release_reference()
        {
            return (--refcount) == 0;
        }

    private:

        std::atomic_size_t refcount{1};
    };

    AdaShadowIteratorHolder*
    new_sequential_sampler_iterator_start(
        AdaShadowMNISTDataLoaderSequentialSampler* shadow,
        ada_c_error_type* err)
    {
        try {
            assert(shadow);
            return new AdaShadowIteratorHolder(shadow->dl->begin());
        }
        catch (...) {
            handle_exception(err, __FUNCTION__);
            return nullptr;
        }
    }

    AdaShadowIteratorHolder*
    new_sequential_sampler_iterator_end(
        AdaShadowMNISTDataLoaderSequentialSampler* shadow,
        ada_c_error_type* err)
    {
        try {
            assert(shadow);
            return new AdaShadowIteratorHolder(shadow->dl->end());
        }
        catch (...) {
            handle_exception(err, __FUNCTION__);
            return nullptr;
        }
    }

    AdaShadowIteratorHolder*
    new_default_sampler_iterator_start(
        AdaShadowMNISTDataLoaderDefaultSampler* shadow,
        ada_c_error_type* err)
    {
        try {
            assert(shadow);
            return new AdaShadowIteratorHolder(shadow->dl->begin());
        }
        catch (...) {
            handle_exception(err, __FUNCTION__);
            return nullptr;
        }
    }
    
    AdaShadowIteratorHolder*
    new_default_sampler_iterator_end(
        AdaShadowMNISTDataLoaderDefaultSampler* shadow,
        ada_c_error_type* err)
    {
        try {
            assert(shadow);
            return new AdaShadowIteratorHolder(shadow->dl->end());
        }
        catch (...) {
            handle_exception(err, __FUNCTION__);
            return nullptr;
        }
    }

    // Delete iterators created by any of the above functions:

    void
    iterator_add_reference(AdaShadowIteratorHolder* shadow)
    {
        assert(shadow);
        shadow->add_reference();
    }

    void
    iterator_release_reference(AdaShadowIteratorHolder* shadow)
    {
        assert(shadow);
        if (shadow->release_reference()) {
            delete shadow;
        }
    }
    
    // Advancing and checking iterators:
    
    void
    advance_iterator(AdaShadowIteratorHolder* holder)
    {
        assert(holder);
        ++(holder->it);
    }

    int8_t
    iterators_are_equal(AdaShadowIteratorHolder* h1,
                        AdaShadowIteratorHolder* h2)
    {
        assert(h1);
        assert(h2);
        return (h1->it) == (h2->it);
    }

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
