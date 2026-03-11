#ifndef _TORCH_NN_MODULE_H
#define _TORCH_NN_MODULE_H

// uses:
#include <torch/torch.h>

// A shadow class to which all Ada side calls for methods inherited
// from Module will be delegated:

struct AdaShadowModule : torch::nn::Module {

    // The 'ada_module' does not belong to the C++ object. The
    // 'ada_module' is managed on the Ada side, will contain the
    // pointer to 'this' object of the AdaShadowModule type and will
    // correctly deallocate that object when Ada variable will cease
    // to exist. This, the 'ada_module' member is for reference only
    // and does not need to be managed:
    struct AdaModule *ada_module;
    
    AdaShadowModule (struct AdaModule *module) : ada_module(module) {}

    virtual torch::Tensor forward(torch::Tensor x);
};

#endif
