// Exports:
#include <tensors.h>

// Uses:
#include <torch/torch.h>
#include <c10/util/ArrayRef.h>
#include <stdio.h>
#include <assert.h>
#include <ada_c_error_codes.h>
#include <ada_c_error_code_helpers.h>

// Functions that Ada will call to create an AdaShadowModule object
// and to destroy them. Ada side will own all created methods and take
// care to manage their lifetime:

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
        delete shadow_tensor;
    }

    void tensor_copy (AdaShadowTensor* dst, AdaShadowTensor* src)
    {
        assert (dst);
        assert (src);
        dst->tensor = src->tensor;
    }

    static inline
    void torch_tensor_relu (torch::Tensor& retval, torch::Tensor& x,
                            ada_c_error_type *err)
    {
        try {
            retval = torch::relu (x);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
    }

    void tensor_relu (AdaShadowTensor* retval, AdaShadowTensor* x,
                      ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_relu (retval->tensor, x->tensor, err);
    }
    
    static inline
    void torch_tensor_log_softmax (torch::Tensor& retval, torch::Tensor& x,
                                   int64_t dim, ada_c_error_type *err)
    {
        try {
            retval = torch::log_softmax (x, dim);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
    }

    void tensor_log_softmax (AdaShadowTensor* retval, AdaShadowTensor* x,
                             int64_t dim, ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_log_softmax (retval->tensor, x->tensor, dim, err);
    }
    
    static inline
    void torch_tensor_max_pool2d (torch::Tensor& retval, torch::Tensor& x,
                                  int64_t n, ada_c_error_type *err)
    {
        try {
            retval = torch::max_pool2d (x, n);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
    }

    void tensor_max_pool2d (AdaShadowTensor* retval, AdaShadowTensor* x,
                            int64_t n, ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_max_pool2d (retval->tensor, x->tensor, n, err);
    }
    
    static inline
    void torch_tensor_dropout (torch::Tensor& retval, torch::Tensor& x,
                               double p, int8_t is_training,
                               ada_c_error_type *err)
    {
        try {
            retval = torch::dropout (x, p, is_training);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
    }

    void tensor_dropout (AdaShadowTensor* retval, AdaShadowTensor* x,
                         double p, int8_t is_training,
                         ada_c_error_type *err)
    {
        assert (x);
        assert (retval);
        torch_tensor_dropout (retval->tensor, x->tensor, p, is_training, err);
    }

    static inline
    void torch_tensor_view (torch::Tensor& ret, torch::Tensor& self,
                            int64_t *params, int64_t nparam,
                            ada_c_error_type *err)
    {
        try {
            c10::ArrayRef<int64_t> param_array(params, nparam);
            ret = self.view (param_array);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
    }

    void tensor_view (AdaShadowTensor* retval, AdaShadowTensor* x,
                      int64_t *params, int64_t nparam,
                      ada_c_error_type *err)
    {
        assert (retval);
        assert (x);
        assert (params);

        torch_tensor_view (retval->tensor, x->tensor, params, nparam, err);
    }

    AdaShadowTensor*
    new_tensor_nll_loss (AdaShadowTensor* output,
                         AdaShadowTensor* target,
                         ada_c_error_type *err)
    {
        assert (output);
        assert (target);

        try {
            auto loss = torch::nll_loss(output->tensor, target->tensor);
            return new AdaShadowTensor (loss);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
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
            auto loss = torch::nll_loss(output->tensor, target->tensor,
                                        /*weight =*/{},
                                        torch::Reduction::Sum);

            return new AdaShadowTensor (loss);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return NULL;
    }

    float
    tensor_nll_loss_sum_as_float (AdaShadowTensor* output,
                                  AdaShadowTensor* target,
                                  ada_c_error_type *err)
    {
        assert (output);
        assert (target);

        try {
            return
                torch::nll_loss(output->tensor, target->tensor,
                                /*weight =*/{},
                                torch::Reduction::Sum)
                .template item<float>();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0.0;
    }

    int64_t
    tensor_size(AdaShadowTensor* t, int64_t dim, ada_c_error_type *err)
    {
        assert(t);
        try {
            return t->tensor.size(dim);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }
    
    float
    tensor_float_item(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            return t->tensor.template item<float>();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0.0;
    }
    
    int64_t
    tensor_int64_item(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            return t->tensor.template item<int64_t>();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }
    
    int8_t
    tensor_is_nan(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            return std::isnan(t->tensor.template item<float>());
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }

    void
    tensor_backward(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            t->tensor.backward();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
    }
    
    AdaShadowTensor*
    new_tensor_arg_max(AdaShadowTensor* t, uint64_t idx,
                       ada_c_error_type *err)
    {
        assert(t);
        try {
            auto argmax = t->tensor.argmax(idx);
            return new AdaShadowTensor (argmax);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return NULL;
    }

    AdaShadowTensor*
    new_tensor_eq(AdaShadowTensor* t1, AdaShadowTensor* t2,
                  ada_c_error_type *err)
    {
        assert(t1);
        assert(t2);

        try {
            auto eq = t1->tensor.eq(t2->tensor);
            return new AdaShadowTensor (eq);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return NULL;
    }
    
    AdaShadowTensor*
    new_tensor_sum(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            auto sum = t->tensor.sum();
            return new AdaShadowTensor(sum);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return NULL;
    }

    AdaShadowTensor*
    new_tensor_min(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            auto min = t->tensor.min();
            return new AdaShadowTensor(min);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return NULL;
    }

    AdaShadowTensor*
    new_tensor_max(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            auto max = t->tensor.max();
            return new AdaShadowTensor(max);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return NULL;
    }

    AdaShadowTensor*
    new_tensor_mean(AdaShadowTensor* t, ada_c_error_type *err)
    {
        assert(t);
        try {
            auto mean = t->tensor.mean();
            return new AdaShadowTensor(mean);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return NULL;
    }

    //-------------------------------------------------------------------------
    // Accessor functions:

    int64_t
    tensor_dim(AdaShadowTensor* t, ada_c_error_type *err)
    {
        try {
            assert(t);
            return t->tensor.dim();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }
    
    int64_t
    tensor_numel(AdaShadowTensor* t, ada_c_error_type *err)
    {
        try {
            assert(t);
            return t->tensor.numel();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }
    
    int64_t
    tensor_stride(AdaShadowTensor* t, int64_t dim, ada_c_error_type *err)
    {
        try {
            assert(t);
            return t->tensor.stride(dim);
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }

    int8_t
    tensor_is_cuda(AdaShadowTensor* t, ada_c_error_type *err)
    {
        try {
            assert(t);
            return t->tensor.is_cuda();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }

    int8_t
    tensor_is_contiguous(AdaShadowTensor* t, ada_c_error_type *err)
    {
        try {
            assert(t);
            return t->tensor.is_contiguous();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }

    int8_t // aka c10::DeviceIndex
    tensor_get_device(AdaShadowTensor* t, ada_c_error_type *err)
    {
        try {
            assert(t);
            return t->tensor.get_device();
        }
        catch (c10::Error e) {
            propagate_error(err, e.what(), __FUNCTION__, 13);
        }
        return 0;
    }

    // Advanced tensor constructors:

    AdaShadowTensor*
    new_tensor_rand(int64_t *dims, int64_t ndim)
    {
        torch::IntArrayRef dimensions = at::IntArrayRef(dims, ndim);
        torch::Tensor rand = torch::rand(dimensions);
        return new (std::nothrow) AdaShadowTensor (rand);
    }

    // Tensor element accessor functions:

    int64_t tensor_get_int64(AdaShadowTensor*  src,
                             const int64_t*    indices,
                             int64_t           ndim,
                             ada_c_error_type* err)
    {
        try {
            if (!src) {
                throw std::invalid_argument("null argument");
            }

            if (ndim > 0 && !indices) {
                throw std::invalid_argument("null index array");
            }

            torch::Tensor t = src->tensor;

            for (int64_t i = 0; i < ndim; i++) {
                // After each .select(i, …), the tensor rank shrinks (ChatGPT).
                //
                // Therefore, we use t.select(0, ...), not
                // t.select(i,...), in each iteration (ChatGPT, S.G.):
                t = t.select(0, indices[i]);
            }

            return t.item<int64_t>();
        }
        catch (...) {
            handle_exception(err, __FUNCTION__);
            return 0;
        }
    }

    double tensor_get_float64 (AdaShadowTensor*  src,
                               const int64_t*    indices,
                               int64_t           ndim,
                               ada_c_error_type* err)
    {
        try {
            if (!src) {
                throw std::invalid_argument("null argument");
            }

            if (ndim > 0 && !indices) {
                throw std::invalid_argument("null index array");
            }

            torch::Tensor t = src->tensor;

            for (int64_t i = 0; i < ndim; ++i) {
                // After each .select(i, …), the tensor rank shrinks (ChatGPT).
                //
                // Therefore, we use t.select (0, ...), not
                // t.select(i,...), in each iteration (ChatGPT, S.G.):
                t = t.select(0, indices[i]);
            }

            return t.item<double>();
        }
        catch (...) {
            handle_exception(err, __FUNCTION__);
            return 0.0;
        }
    }
    
}; // extern "C"
