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
    > *
    new_mnist_normaliser(torch::data::datasets::MNIST *ds,
                         double x, double y)
    {
        torch::data::transforms::Normalize<> normalise(x, y);
        auto ret =
            new
            torch::data::datasets::MapDataset<
                torch::data::datasets::MNIST,
                torch::data::transforms::Normalize<>
            > (*ds, normalise);
        return ret;
    }

    void
    delete_mnist_normaliser(torch::data::datasets::MapDataset<
                            torch::data::datasets::MNIST,
                            torch::data::transforms::Normalize<>
                            > *ds)
    {
        delete ds;
    }
    
    torch::data::datasets::MapDataset<
        torch::data::datasets::MNIST,
        torch::data::transforms::Stack<>
    > *
    new_mnist_stack(torch::data::datasets::MNIST *ds,
                    torch::data::transforms::Stack<> *transform)
    {
        auto ret =
            new
            torch::data::datasets::MapDataset<
                torch::data::datasets::MNIST,
                torch::data::transforms::Stack<>
            >            
            (*ds, *transform);
        return ret;
    }

    void
    delete_mnist_stack(torch::data::datasets::MapDataset<
                       torch::data::datasets::MNIST,
                       torch::data::transforms::Stack<>
                       > *ds)
    {
        delete ds;
    }
    
}
