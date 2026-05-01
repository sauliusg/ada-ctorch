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
#ifdef ADA_CTORCH_DEBUG_PRINT
        cout << "Creating a new shadow Module object for Ada variable at "
             << module << endl;
#endif
        return new (std::nothrow) AdaShadowModule (module);
    }

    void delete_AdaShadowModule (struct AdaShadowModule* shadow_module)
    {
        using namespace std;
#ifdef ADA_CTORCH_DEBUG_PRINT
        cout << "Deleting the shadow Module object for Ada, object's address is "
             << shadow_module << endl;
#endif
        delete shadow_module;
    }

    uint8_t module_is_training (struct AdaShadowModule* shadow_module)
    {
        return shadow_module->is_training();
    }

    std::vector<torch::Tensor>*
    new_parameters(struct AdaShadowModule* shadow_module)
    {
        return new (std::nothrow)
            std::vector<torch::Tensor> (shadow_module->parameters());
    }

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
