// uses:
#include <torch/torch.h>

extern "C" {

    std::vector<torch::Tensor>*
    new_vector_of_tensor(std::vector<torch::Tensor>* vector)
    {
        return new (std::nothrow)
            std::vector<torch::Tensor> (*vector);
    }

    void
    delete_vector_of_tensor(std::vector<torch::Tensor>* parameters)
    {
        delete parameters;
    }
    
}; // extern "C"
