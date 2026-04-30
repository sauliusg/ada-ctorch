// uses:
#include <torch/torch.h>

extern "C" {

    torch::optim::SGDOptions*
    new_sgd_options(double x)
    {
        return new (std::nothrow) torch::optim::SGDOptions(x);
    }

    void
    delete_sgd_options(torch::optim::SGDOptions* opt)
    {
        delete opt;
    }    

}; // extern "C"
