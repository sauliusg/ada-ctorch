#include <torch/torch.h>
#include <assert.h>

#include <iostream>

struct AdaConv2d;

// A shadow class to which all Ada side calls for methods inherited
// from Module will be delegated:

struct AdaShadowConv2d : torch::nn::Conv2d {

    // The 'ada_conv2D' does not belong to the C++ object. The
    // 'ada_module' is managed on the Ada side, will contain the
    // pointer to 'this' object of the AdaShadowModule type and will
    // correctly deallocate that object when Ada variable will cease
    // to exist. This, the 'ada_conv2d' member is for reference only
    // and does not need to be managed:
    struct AdaConv2d *ada_conv2d;
    
    AdaShadowConv2d (struct AdaConv2d *conv2d) :
        torch::nn::Conv2d(nullptr), ada_conv2d(conv2d) {}

    AdaShadowConv2d (torch::nn::Conv2dOptions *options) :
        torch::nn::Conv2d(*options), ada_conv2d(NULL) {}
};

// Functions that Ada will call to create an AdaShadowConv2d object
// and to destroy them. Ada side will own all created objects and
// manage their lifetime:

extern "C" {

struct AdaShadowConv2d*
new_AdaShadowConv2d (AdaConv2d *conv2d)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow Conv2d object for Ada variable at "
         << conv2d << endl;
    return new (std::nothrow) AdaShadowConv2d (conv2d);
}

struct AdaShadowConv2d*
new_AdaShadowConv2d_for_options (torch::nn::Conv2dOptions *options)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow Conv2d object from options at "
         << options << endl;
    return new (std::nothrow) AdaShadowConv2d (options);
}

void
delete_AdaShadowConv2d (struct AdaShadowConv2d* shadow_object)
{
    using namespace std;
    cout << "Deleting the shadow Conv2d object for Ada, object's address is "
         << shadow_object << endl;
    delete shadow_object;
}

void
AdaShadowConv2d_set_self (struct AdaShadowConv2d* c_side, AdaConv2d *ada_side)
{
    assert (c_side);
    using namespace std;
    cout << "Setting self reference to the Ada side object address "
         << ada_side
         << " for the C++ shadow object "
         << c_side << endl;
    c_side->ada_conv2d = ada_side;
}
    
}; // extern "C"
