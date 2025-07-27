#include <torch/torch.h>

struct AdaModule;

// Defined on the Ada side:
torch::Tensor call_ada_forward_method (AdaModule *m, torch::Tensor x);

// A shadow class to which all Ada side calls for methods inherited
// from Module will be delegated:

struct AdaShadowModule : torch::nn::Module {

    // On the Ada side, the object can be copied durung the assignment
    // and will share the PyTorch object. We will use ths reference
    // counter to determine when the last 'ada_module' owner will go
    // out of scope and we need to deallocate the object:
    ssize_t refcount;
    
    // The 'ada_module' does not belong to the C++ object. The
    // 'ada_module' is managed on the Ada side, will contain the
    // pointer to 'this' object of the AdaShadowModule type and will
    // correctly deallocate that object when Ada variable will cease
    // to exist. This, the 'ada_module' member is for reference only
    // and does not need to be managed:
    struct AdaModule *ada_module;
    
    AdaShadowModule (struct AdaModule *module) : ada_module(module), refcount(1) {}

    torch::Tensor forward(torch::Tensor x) {
        return call_ada_forward_method (this->ada_module, x);
    }
    
};

// Functions that Ada will call to create an AdaShadowModule object
// and to destroy them. Ada side will own all created methods and care
// to manage their lifetime:

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

// Manage reference counter from the Ada side:

ssize_t get_refcount (struct AdaShadowModule* shadow_module)
{
    return shadow_module->refcount;
}

ssize_t inc_refcount (struct AdaShadowModule* shadow_module)
{
    shadow_module->refcount ++;
    return shadow_module->refcount;
}

ssize_t dec_refcount (struct AdaShadowModule* shadow_module)
{
    shadow_module->refcount --;
    return shadow_module->refcount;
}
