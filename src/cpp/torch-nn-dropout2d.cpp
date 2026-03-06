// uses:
#include <torch/torch.h>
#include <torch-nn-module.h>
#include <assert.h>

#include <iostream>

struct AdaDropout2d;

// A shadow class to which all Ada side calls for methods inherited
// from Module will be delegated:

struct AdaShadowDropout2d : torch::nn::Dropout2d {

    // The 'ada_dropout2d' does not belong to the C++ object. The
    // 'ada_module' is managed on the Ada side, will contain the
    // pointer to 'this' object of the AdaShadowModule type and will
    // correctly deallocate that object when Ada variable will cease
    // to exist. This, the 'ada_dropout2d' member is for reference only
    // and does not need to be managed:
    struct AdaDropout2d *ada_dropout2d;
    
    AdaShadowDropout2d (struct AdaDropout2d *dropout2d) :
        ada_dropout2d(dropout2d) {}
};

// Functions that Ada will call to create an AdaShadowDropout2d object
// and to destroy them. Ada side will own all created objects and
// manage their lifetime:

extern "C" {

struct AdaShadowDropout2d*
new_AdaShadowDropout2d (AdaDropout2d *dropout2d)
{
    // We will handle allocation failure on the Ada side, no need to
    // throw (raise) and exception here:
    using namespace std;
    cout << "Creating a new shadow Dropout2d object for Ada variable at "
         << dropout2d << endl;
    return new (std::nothrow) AdaShadowDropout2d (dropout2d);
}

void
delete_AdaShadowDropout2d (struct AdaShadowDropout2d* shadow_object)
{
    using namespace std;
    cout << "Deleting the shadow Dropout2d object for Ada, object's address is "
         << shadow_object << endl;
    delete shadow_object;
}
    
}; // extern "C"
