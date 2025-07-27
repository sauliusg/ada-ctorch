#include <torch/torch.h>
#include <assert.h>

struct AdaShadowTensor : torch::Tensor {
    
    // Shadow tensors can be shared between the Ada variables,
    // reference counted and copied to an unshared copy if
    // modification is required. The 'refcount' will keep track of how
    // many Ada variables have reference to the given tensor:
    
    int refcount;
    
    AdaShadowTensor () : refcount(1) {}

};

// Functions that Ada will call to create an AdaShadowModule object
// and to destroy them. Ada side will own all created methods and care
// to manage their lifetime:

extern "C" {

    struct AdaShadowTensor* new_AdaShadowTensor ()
    {
        // We will handle allocation failure on the Ada side, no need to
        // throw (raise) and exception here:
        ////using namespace std;
        ////cout << "Creating a new shadow tensor " << endl;
        return new (std::nothrow) AdaShadowTensor ();
    }

    void delete_AdaShadowTensor (struct AdaShadowTensor* shadow_tensor)
    {
        assert (shadow_tensor);
        assert (shadow_tensor->refcount == 0);
        ////using namespace std;
        ////cout << "Deleting the shadow tensor " << shadow_tensor << endl;
        delete shadow_tensor;
    }

    void inc_tensor_refcount (AdaShadowTensor* t)
    {
        assert (t);
        t->refcount ++;
        ////using namespace std;
        ////cout << "inc_refcount: " << t->refcount << endl;
    }
    
    int dec_tensor_refcount (AdaShadowTensor* t)
    {
        assert (t);
        t->refcount --;
        ////using namespace std;
        ////cout << "dec_refcount: " << t->refcount << endl;
        return t->refcount;
    }
    
    int get_tensor_refcount (AdaShadowTensor* t)
    {
        assert (t);
        return t->refcount;
    }
    
}; // extern "C"
