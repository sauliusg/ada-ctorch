#include <torch/torch.h>

struct AdaModule;

// Defined on the Ada side:
torch::Tensor call_ada_forward_method (AdaModule *m, torch::Tensor x);

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

    torch::Tensor forward(torch::Tensor x) {
        return call_ada_forward_method (this->ada_module, x);
    }
    
};

// Functions that Ada will call to create an AdaShadowModule object
// and to destroy them. Ada side will own all created methods and care
// to manage their lifetime:

extern "C" {

struct AdaShadowModule* new_AdaShadowModule (AdaModule *module)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    return new (std::nothrow) AdaShadowModule (module);
}

void delete_AdaShadowModule (struct AdaShadowModule* shadow_module)
{
    delete shadow_module;
}

}; // extern "C"
