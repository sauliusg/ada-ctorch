// declares:
#include <torch-nn-module.h>

// uses:
#include <torch/torch.h>

#include <iostream>

struct AdaModule;

// Defined on the Ada side:

extern "C"
torch::Tensor *call_ada_forward_method (AdaModule *m,
                                        torch::Tensor *x,
                                        torch::Tensor *result);

// virtual:
torch::Tensor AdaShadowModule::forward(torch::Tensor x) {
    torch::Tensor result;
    return *call_ada_forward_method (this->ada_module, &x, &result);
}

// Functions that Ada will call to create an AdaShadowModule object
// and to destroy them. Ada side will own all created methods and care
// to manage their lifetime:

extern "C" {

struct AdaShadowModule* new_AdaShadowModule (AdaModule *module)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow Module object for Ada variable at "
         << module << endl;
    return new (std::nothrow) AdaShadowModule (module);
}

void delete_AdaShadowModule (struct AdaShadowModule* shadow_module)
{
    using namespace std;
    cout << "Deleting the shadow Module object for Ada, object's address is "
         << shadow_module << endl;
    delete shadow_module;
}

uint8_t module_is_training (struct AdaShadowModule* shadow_module)
{
    return shadow_module->is_training();
}
    
}; // extern "C"
