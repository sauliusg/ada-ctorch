// Exports:
#include <torch-datasets.h>

// Uses:
#include <torch/torch.h>
#include <torch/data/transforms/tensor.h>
#include <ada_c_error_codes.h>

extern "C" {

    torch::data::datasets::MNIST*
    new_mnist_dataset (char *root, uint8_t mode,
                       ada_c_error_type *err)
    {
        try {
            if (mode == 0) { /* mode: train */
                return new torch::data::datasets::MNIST(root);
            } else { /* mode: test */
                return new torch::data::datasets::MNIST
                    (root, torch::data::datasets::MNIST::Mode::kTest);
            }
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
    delete_mnist_dataset (torch::data::datasets::MNIST* dset)
    {
        delete dset;
    }

    uint64_t
    mnist_dataset_size (torch::data::datasets::MNIST *ds)
    {
        if (ds) {
            return ds->size().value();
        } else {
            return 0;
        }
    }
    
    mnist_normalised_dataset_t *
    new_mnist_normaliser(torch::data::datasets::MNIST *ds,
                         double x, double y)
    {
        torch::data::transforms::Normalize<> normalise(x, y);
        auto ret =
            new mnist_normalised_dataset_t (*ds, normalise);
        return ret;
    }

    void
    delete_mnist_normaliser(mnist_normalised_dataset_t *ds)
    {
        delete ds;
    }
    
    mnist_stacked_dataset_t *
    new_mnist_stack(mnist_normalised_dataset_t *ds)
    {
        
        auto ret =
            new mnist_stacked_dataset_t
                (*ds, torch::data::transforms::Stack<>());
        return ret;
    }

    void
    delete_mnist_stack(mnist_stacked_dataset_t *ds)
    {
        delete ds;
    }
    
}
