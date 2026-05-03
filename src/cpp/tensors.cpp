// Exports:
#include <tensors.h>

// Uses:
#include <torch/torch.h>
#include <c10/util/ArrayRef.h>
#include <stdio.h>
#include <assert.h>
#include <ada_c_error_codes.h>

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
    void torch_tensor_log_softmax (torch::Tensor* retval, torch::Tensor* x,
                                   int64_t dim, ada_c_error_type *err)
    {
        try {
            *retval = torch::log_softmax (*x, dim);
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

    void tensor_log_softmax (AdaShadowTensor* retval, AdaShadowTensor* x,
                             int64_t dim, ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_log_softmax (retval, x, dim, err);
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
                               double p, int8_t is_training,
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
                         double p, int8_t is_training,
                         ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_dropout (retval, x, p, is_training, err);
    }

    static inline
    void torch_tensor_view (torch::Tensor *ret, torch::Tensor *self,
                            int64_t *params, int64_t nparam,
                            ada_c_error_type *err)
    {
        try {
            c10::ArrayRef<int64_t> param_array(params, nparam);
            *ret = self->view (param_array);
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

    void tensor_view (AdaShadowTensor* retval, AdaShadowTensor* x,
                      int64_t *params, int64_t nparam,
                      ada_c_error_type *err)
    {
        torch_tensor_view (retval, x, params, nparam, err);
    }

    AdaShadowTensor*
    new_tensor_nll_loss (AdaShadowTensor* output,
                         AdaShadowTensor* target,
                         ada_c_error_type *err)
    {
        assert (output);
        assert (target);

        try {
            return new AdaShadowTensor (torch::nll_loss(*output, *target));
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
        return NULL;
    }

    AdaShadowTensor*
    new_tensor_nll_loss_sum (AdaShadowTensor* output,
                             AdaShadowTensor* target,
                             ada_c_error_type *err)
    {
        assert (output);
        assert (target);

        try {
            return new AdaShadowTensor
                (torch::nll_loss(*output, *target,
                                 /*weight =*/{},
                                 torch::Reduction::Sum));
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
        return NULL;
    }

    int64_t
    tensor_size(AdaShadowTensor* t, int64_t dim, ada_c_error_type *err)
    {
        assert(t);
        try {
            return ((torch::Tensor)*t).size(dim);
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
        return 0.0;
    }
    
    float
    tensor_float_item(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            return ((torch::Tensor)*t).template item<float>();
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
        return 0.0;
    }
    
    int8_t
    tensor_is_nan(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            return std::isnan(((torch::Tensor)*t).template item<float>());
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
        return 0;
    }

    void
    tensor_backward(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            ((torch::Tensor)*t).backward();
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
    
    AdaShadowTensor*
    new_tensor_arg_max(AdaShadowTensor* t, uint64_t idx,
                       ada_c_error_type *err)
    {
        assert(t);
        try {
            return new AdaShadowTensor(((torch::Tensor)*t).argmax(idx));
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
        return 0;
    }
    
}; // extern "C"
