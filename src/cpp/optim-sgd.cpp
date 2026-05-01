// uses:
#include <torch/torch.h>
#include <assert.h>

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

    void
    set_momentum(torch::optim::SGDOptions* opt, double m)
    {
        assert(opt);
        opt->momentum(m);
    }
    
}; // extern "C"
