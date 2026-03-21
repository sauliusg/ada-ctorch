#include <torch/torch.h>
#include <torch/data/transforms/tensor.h>
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

    torch::data::datasets::MapDataset<
        torch::data::datasets::MNIST,
        torch::data::transforms::Normalize<>
    >
    mnist_normalise(torch::data::datasets::MNIST *ds,
                    torch::data::transforms::Normalize<> *transform)
    {
        return ds->map(*transform);
    }
    
    torch::data::datasets::MapDataset<
        torch::data::datasets::MNIST,
        torch::data::transforms::Normalize<>
    > *
    new_mnist_normalises(torch::data::datasets::MNIST *ds,
                         torch::data::transforms::Normalize<> *transform)
    {
        auto ret =
            new
            torch::data::datasets::MapDataset<
                torch::data::datasets::MNIST,
                torch::data::transforms::Normalize<>
            > (*ds, *transform);
        return ret;
    }
    
    torch::data::datasets::MapDataset<
        torch::data::datasets::MNIST,
        torch::data::transforms::Stack<>
    >
    mnist_to_tensor(torch::data::datasets::MNIST *ds,
                    torch::data::transforms::Stack<> *transform)
    {
        return ds->map(*transform);
    }
    
}
