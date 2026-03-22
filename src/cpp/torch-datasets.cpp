// Exports:
#include <torch-datasets.h>

// Uses:
#include <torch/torch.h>
#include <torch/data/transforms/tensor.h>

extern "C" {

    torch::data::datasets::MNIST*
    new_mnist_dataset (char *root)
    {
        return new (std::nothrow) torch::data::datasets::MNIST(root);
    }

    void
    delete_mnist_dataset (torch::data::datasets::MNIST* dset)
    {
        delete dset;
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
    new_mnist_stack(mnist_normalised_dataset_t *ds,
                    torch::data::transforms::Stack<> *transform)
    {
        auto ret =
            new mnist_stacked_dataset_t (*ds, *transform);
        return ret;
    }

    void
    delete_mnist_stack(mnist_stacked_dataset_t *ds)
    {
        delete ds;
    }
    
}
