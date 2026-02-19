#include <torch/torch.h>

#include <iostream>

struct AdaConv2dOptions;

// A shadow class to which all Ada side calls for methods inherited
// from Module will be delegated:

struct AdaShadowConv2dOptions : torch::nn::Conv2dOptions {

    // The 'ada_conv2doptions' does not belong to the C++ object. The
    // 'ada_module' is managed on the Ada side, will contain the
    // pointer to 'this' object of the AdaShadowModule type and will
    // correctly deallocate that object when Ada variable will cease
    // to exist. This, the 'ada_conv2d' member is for reference only
    // and does not need to be managed:
    struct AdaConv2dOptions *ada_conv2doptions;
    
    AdaShadowConv2dOptions (struct AdaConv2dOptions *conv2dopt,
                            int64_t x,
                            int64_t y,
                            int64_t ks /* kernel size */) :
        torch::nn::Conv2dOptions (x, y, ks), ada_conv2doptions(conv2dopt) {}

};

// Functions that Ada will call to create an AdaShadowConv2dOptions object
// and to destroy them. Ada side will own all created objects and
// manage their lifetime:

extern "C" {

struct AdaShadowConv2dOptions* new_AdaShadowConv2dOptions (AdaConv2dOptions *conv2dopt,
                                                           int64_t x,
                                                           int64_t y,
                                                           int64_t ks)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow object for Ada variable at " << conv2dopt << endl;
    return new (std::nothrow) AdaShadowConv2dOptions (conv2dopt, x, y, ks);
}

void delete_AdaShadowConv2dOptions (struct AdaShadowConv2dOptions* shadow_object)
{
    using namespace std;
    cout << "Deleting the shadow object for Ada, object's address is " << shadow_object << endl;
    delete shadow_object;
}

}; // extern "C"
