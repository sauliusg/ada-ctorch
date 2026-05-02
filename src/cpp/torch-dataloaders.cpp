// Exports:
#include <torch-dataloaders.h>

// Uses:
#include <torch/torch.h>
#include <torch-datasets.h>
#include <ada_c_error_codes.h>

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

        AdaShadowIteratorHolder(example_iterator_t iter): it(iter) {};
    };

    AdaShadowIteratorHolder*   
    get_sequential_sampler_iterator(AdaShadowMNISTDataLoaderSequentialSampler* shadow)
    {
        return new (std::nothrow) AdaShadowIteratorHolder(shadow->dl->begin());
    }

    AdaShadowIteratorHolder*   
    get_default_sampler_iterator(AdaShadowMNISTDataLoaderDefaultSampler* shadow)
    {
        return new (std::nothrow) AdaShadowIteratorHolder(shadow->dl->begin());
    }
    
    void
    delete_ada_shadow_iterator_holder(AdaShadowIteratorHolder* holder)
    {
        delete holder;
    }
}
