// uses:
#include <torch/torch.h>
#include <assert.h>

extern "C" {

    torch::optim::SGD*
    new_sgd(std::vector<torch::Tensor> *parameters,
            torch::optim::SGDOptions *options)
    {
        return new (std::nothrow) torch::optim::SGD(*parameters, *options);
    }

    void
    delete_sgd(torch::optim::SGD* sgd)
    {
        delete sgd;
    }
    
    // ------------------------------------------------------------------------
    
    torch::optim::SGDOptions*
    new_sgd_options(double lr)
    {
        return new (std::nothrow) torch::optim::SGDOptions(lr);
    }

    void
    delete_sgd_options(torch::optim::SGDOptions* opt)
    {
        delete opt;
    }    

    void
    set_momentum(torch::optim::SGDOptions* opt, double m)
    {
        assert(opt);
        opt->momentum(m);
    }
    
}; // extern "C"
