// Uses:
#include <torch/torch.h>

extern "C" {

    torch::NoGradGuard*
    new_shadow_no_grad_guard()
    {
        return new (std::nothrow) torch::NoGradGuard;
    }

    void
    delete_shadow_no_grad_guard(torch::NoGradGuard* g)
    {
        delete g;
    }

}; // extern "C"
