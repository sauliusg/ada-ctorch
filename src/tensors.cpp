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
        return new (std::nothrow) AdaShadowTensor ();
    }

    void delete_AdaShadowTensor (struct AdaShadowTensor* shadow_tensor)
    {
        assert (shadow_tensor);
        assert (shadow_tensor->refcount == 0);
        delete shadow_tensor;
    }

    void inc_tensor_refcount (AdaShadowTensor* t)
    {
        assert (t);
        t->refcount ++;
    }
    
    int dec_tensor_refcount (AdaShadowTensor* t)
    {
        assert (t);
        t->refcount --;
        return t->refcount;
    }
    
    int get_tensor_refcount (AdaShadowTensor* t)
    {
        assert (t);
        return t->refcount;
    }

    static inline
    void torch_tensor_copy (torch::Tensor* dst, torch::Tensor* src)
    {
        assert (dst);
        assert (src);
        *dst = *src;
    }
    
    void tensor_copy (AdaShadowTensor* dst, AdaShadowTensor* src)
    {
        torch_tensor_copy (dst, src);
    }

    static inline
    void torch_tensor_relu (torch::Tensor* retval, torch::Tensor* x)
    {
        try {
            *retval = torch::relu (*x);
        }
        catch (c10::Error e) {
            // std::cout << e.what() << std::endl;
            std::cout << "!!! c10::Error was thrown." << std::endl;
            throw "... Terminating ...";
            //std::flush(std::cout);
            // throw e;
        }
    }

    void tensor_relu (AdaShadowTensor* retval, AdaShadowTensor* x)
    {
        assert (x);
        assert (retval);
        torch_tensor_relu (retval, x);
    }
    
}; // extern "C"
