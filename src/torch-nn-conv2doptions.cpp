#include <torch/torch.h>

#include <iostream>

// There is no dedicated AdaShadowConv2dOptions object; we simply use
// torch::nn::Conv2dOptions for this and return pointers to these
// objects to the Ada side.

// Functions that Ada will call to create an AdaShadowConv2dOptions object
// and to destroy them. Ada side will own all created objects and
// manage their lifetime:

extern "C" {

torch::nn::Conv2dOptions* new_AdaShadowConv2dOptions (int64_t x,
                                                      int64_t y,
                                                      int64_t ks)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow Conv2dOptions object for Ada variable" << endl;
    return new (std::nothrow) torch::nn::Conv2dOptions (x, y, ks);
}

void delete_AdaShadowConv2dOptions (torch::nn::Conv2dOptions* shadow_object)
{
    using namespace std;
    cout << "Deleting the shadow Conv2dOptions object for Ada, object's address is "
         << shadow_object << endl;
    delete shadow_object;
}

}; // extern "C"
