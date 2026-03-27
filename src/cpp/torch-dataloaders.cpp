// Exports:
#include <torch-dataloaders.h>

// Uses:
#include <torch/torch.h>
#include <torch-datasets.h>
#include <ada_c_error_codes.h>

extern "C" {

    struct AdaShadowDataLoaderSequentialSampler {
        data_loader_sequential_sampler_t dl;

        AdaShadowDataLoaderSequentialSampler (mnist_stacked_dataset_t* ds,
                                              int64_t batch_size)
        {
            dl = torch::data::make_data_loader
                <torch::data::samplers::SequentialSampler>
                (std::move(*ds), batch_size);
        }
           
    };
    
    AdaShadowDataLoaderSequentialSampler*
    new_data_loader_sequential_sampler (mnist_stacked_dataset_t* ds,
                                        int64_t batch_size,
                                        ada_c_error_type *err)
    {
        try {
            return new AdaShadowDataLoaderSequentialSampler (ds, batch_size);
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
    delete_data_loader_sequential_sampler (AdaShadowDataLoaderSequentialSampler* shadow)
    {
        delete shadow;
    }
    
}
