#include <torch/torch.h>

struct AdaModule;

// A shadow class to which all Ada side calls for methods inherited
// from Module will be delegated:

struct AdaShadowModule : torch::nn::Module {

    struct AdaModule *ada_module;
    
    AdaShadowModule (struct AdaModule *module) : ada_module(module) {}
    
};
