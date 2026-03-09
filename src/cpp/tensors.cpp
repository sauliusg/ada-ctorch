// Expoerts:
#include <torch/torch.h>

// Uses:
#include <stdio.h>
#include <assert.h>
#include <ada_c_error_codes.h>

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
    void torch_tensor_relu (torch::Tensor* retval, torch::Tensor* x,
                            ada_c_error_type *err)
    {
        try {
            *retval = torch::relu (*x);
        }
        catch (c10::Error e) {
            char message [4096];
            snprintf (message, sizeof(message), "(%s \"%s\") - \"%s\"",
                      "forwarded from", __FUNCTION__,
                      e.what());
            message [sizeof(message) - 4] = '.';
            message [sizeof(message) - 3] = '.';
            message [sizeof(message) - 2] = '.';

            message [sizeof(message) - 1] = '\0';
            ada_set_error_code (err, 13);
            ada_set_error_message (err,  message);
        }
    }

    void tensor_relu (AdaShadowTensor* retval, AdaShadowTensor* x,
                      ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_relu (retval, x, err);
    }
    
    static inline
    void torch_tensor_max_pool2d (torch::Tensor* retval, torch::Tensor* x,
                                  int64_t n, ada_c_error_type *err)
    {
        try {
            *retval = torch::max_pool2d (*x, n);
        }
        catch (c10::Error e) {
            char message [4096];
            snprintf (message, sizeof(message), "(%s \"%s\") - \"%s\"",
                      "forwarded from", __FUNCTION__,
                      e.what());
            message [sizeof(message) - 4] = '.';
            message [sizeof(message) - 3] = '.';
            message [sizeof(message) - 2] = '.';

            message [sizeof(message) - 1] = '\0';
            ada_set_error_code (err, 13);
            ada_set_error_message (err,  message);
        }
    }

    void tensor_max_pool2d (AdaShadowTensor* retval, AdaShadowTensor* x,
                            int64_t n, ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_max_pool2d (retval, x, n, err);
    }
    
    static inline
    void torch_tensor_dropout (torch::Tensor* retval, torch::Tensor* x,
                               double p, bool is_training,
                               ada_c_error_type *err)
    {
        try {
            *retval = torch::dropout (*x, p, is_training);
        }
        catch (c10::Error e) {
            char message [4096];
            snprintf (message, sizeof(message), "(%s \"%s\") - \"%s\"",
                      "forwarded from", __FUNCTION__,
                      e.what());
            message [sizeof(message) - 4] = '.';
            message [sizeof(message) - 3] = '.';
            message [sizeof(message) - 2] = '.';

            message [sizeof(message) - 1] = '\0';
            ada_set_error_code (err, 13);
            ada_set_error_message (err,  message);
        }
    }

    void tensor_dropout (AdaShadowTensor* retval, AdaShadowTensor* x,
                         double p, bool is_training,
                         ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_dropout (retval, x, p, is_training, err);
    }
    
}; // extern "C"
