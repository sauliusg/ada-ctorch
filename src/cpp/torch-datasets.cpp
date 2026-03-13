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

    auto
    map(torch::data::datasets::MNIST *ds,
        // torch::data::transforms::TensorTransform<> *transform
        torch::data::transforms::Normalize<> *transform
        )
    {
        return ds->map(*transform);
        // return ds->map(torch::data::transforms::Normalize<>(0.1307, 0.3081));
    }
    
}
