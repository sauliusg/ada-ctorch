// uses:
#include <torch/torch.h>
#include <torch-nn-module.h>
#include <assert.h>

#include <iostream>

struct AdaLinear;

// A shadow class to which all Ada side calls for methods inherited
// from Module will be delegated:

struct AdaShadowLinear : torch::nn::Linear {

    // The 'ada_conv2D' does not belong to the C++ object. The
    // 'ada_module' is managed on the Ada side, will contain the
    // pointer to 'this' object of the AdaShadowModule type and will
    // correctly deallocate that object when Ada variable will cease
    // to exist. This, the 'ada_conv2d' member is for reference only
    // and does not need to be managed:
    struct AdaLinear *ada_linear;
    
    AdaShadowLinear (struct AdaLinear *conv2d) :
        torch::nn::Linear(0, 0), ada_linear(conv2d) {}

    AdaShadowLinear (int64_t x, int64_t y) :
        torch::nn::Linear(x, y), ada_linear(NULL) {}
};

// Functions that Ada will call to create an AdaShadowLinear object
// and to destroy them. Ada side will own all created objects and
// manage their lifetime:

extern "C" {

struct AdaShadowLinear*
new_AdaShadowLinear (AdaLinear *conv2d)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow Linear object for Ada variable at "
         << conv2d << endl;
    return new (std::nothrow) AdaShadowLinear (conv2d);
}

struct AdaShadowLinear*
new_AdaShadowLinear_XY (int64_t x, int64_t y)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow Linear object with x, y = "
         << x << " " << y << endl;
    return new (std::nothrow) AdaShadowLinear (x, y);
}

void
delete_AdaShadowLinear (struct AdaShadowLinear* shadow_object)
{
    using namespace std;
    cout << "Deleting the shadow Linear object for Ada, object's address is "
         << shadow_object << endl;
    delete shadow_object;
}

void
AdaShadowLinear_set_self (struct AdaShadowLinear* c_side, AdaLinear *ada_side)
{
    assert (c_side);
    using namespace std;
    cout << "Setting self reference to the Ada side object address "
         << ada_side
         << " for the C++ shadow object "
         << c_side << endl;
    c_side->ada_linear = ada_side;
}

void
shadow_register_module_linear (struct AdaShadowModule *m,
                               char *c_name,
                               struct AdaShadowLinear* layer)

{
    using namespace std;
    string name = c_name;
    cout << "Linear layer with the name \""
         << c_name
         << "\" is being registered"
         << endl;

    m->register_module (name, *layer);

    cout << "Linear layer with the name \""
         << name
         << "\" registered successfully"
         << endl;
}

void
call_linear_forward_method (torch::Tensor ret, struct AdaShadowLinear *layer,
                            torch::Tensor x)
{
    ret = (*layer)->forward (x);
}

}; // extern "C"
