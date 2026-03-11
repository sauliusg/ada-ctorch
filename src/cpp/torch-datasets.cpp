#include <torch/torch.h>

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

}
