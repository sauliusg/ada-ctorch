#include <torch/torch.h>

#include <iostream>

// There is no dedicated AdaShadowConv1dOptions object; we simply use
// torch::nn::Conv1dOptions for this and return pointers to these
// objects to the Ada side.

// Functions that Ada will call to create an AdaShadowConv1dOptions object
// and to destroy them. Ada side will own all created objects and
// manage their lifetime:

extern "C" {

torch::nn::Conv1dOptions* new_AdaShadowConv1dOptions (int64_t x,
                                                      int64_t y,
                                                      int64_t ks)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
#ifdef ADA_CTORCH_DEBUG_PRINT
    cout << "Creating a new shadow Conv1dOptions object for Ada variable" << endl;
#endif
    return new (std::nothrow) torch::nn::Conv1dOptions (x, y, ks);
}

void delete_AdaShadowConv1dOptions (torch::nn::Conv1dOptions* shadow_object)
{
    using namespace std;
#ifdef ADA_CTORCH_DEBUG_PRINT
    cout << "Deleting the shadow Conv1dOptions object for Ada, object's address is "
         << shadow_object << endl;
#endif
    delete shadow_object;
}

}; // extern "C"
