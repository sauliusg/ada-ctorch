//
//  ada_torch_tensor_wrappers.cpp
//
//  Example LibTorch C ABI wrapper layer for Ada bindings
//

#include <torch/torch.h>

#include <atomic>
#include <cstdint>
#include <exception>
#include <new>
#include <vector>

#include <ada_c_error_codes.h>
#include <ada_c_error_code_helpers.h>
#include <tensors.h>

//
// Helper for dimension arrays
//

static inline torch::IntArrayRef
make_dims(
    int64_t* dims,
    int64_t ndim)
{
    return torch::IntArrayRef(dims, ndim);
}

//
// 1. zeros
//

extern "C"
AdaShadowTensor*
new_tensor_zeros(
    int64_t* dims,
    int64_t ndim,
    ada_c_error_type* err)
{
    try {

        auto t = torch::zeros(
            make_dims(dims, ndim));

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 2. ones
//

extern "C"
AdaShadowTensor*
new_tensor_ones(
    int64_t* dims,
    int64_t ndim,
    ada_c_error_type* err)
{
    try {

        auto t = torch::ones(
            make_dims(dims, ndim));

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 3. empty
//

extern "C"
AdaShadowTensor*
new_tensor_empty(
    int64_t* dims,
    int64_t ndim,
    ada_c_error_type* err)
{
    try {

        auto t = torch::empty(
            make_dims(dims, ndim));

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 4. rand
//

extern "C"
AdaShadowTensor*
new_tensor_random(
    int64_t* dims,
    int64_t ndim,
    ada_c_error_type* err)
{
    try {

        auto t = torch::rand(
            make_dims(dims, ndim));

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 5. randn
//

extern "C"
AdaShadowTensor*
new_tensor_randn(
    int64_t* dims,
    int64_t ndim,
    ada_c_error_type* err)
{
    try {

        auto t = torch::randn(
            make_dims(dims, ndim));

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 6. tensor(int64 scalar)
//

extern "C"
AdaShadowTensor*
new_tensor_int64(
    int64_t value,
    ada_c_error_type* err)
{
    try {

        auto t = torch::tensor(value);

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 6b. tensor(double precision float scalar)
//

extern "C"
AdaShadowTensor*
new_tensor_float64(
    double value,
    ada_c_error_type* err)
{
    try {

        auto t = torch::tensor(value);

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 7. tensor(float array)
//

extern "C"
AdaShadowTensor*
new_tensor_from_float_array(
    float* data,
    int64_t len,
    ada_c_error_type* err)
{
    try {

        std::vector<float> v(
            data,
            data + len);

        auto t = torch::tensor(v);

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 7b. tensor(in64_t array)
//

extern "C"
AdaShadowTensor*
new_tensor_from_int64_array(
    int64_t* data,
    int64_t len,
    ada_c_error_type* err)
{
    try {

        std::vector<int64_t> v(
            data,
            data + len);

        auto t = torch::tensor(v);

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 8. clone
//

extern "C"
AdaShadowTensor*
tensor_clone(
    AdaShadowTensor* src,
    ada_c_error_type* err)
{
    try {

        auto t = src->tensor.clone();

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 9. reshape
//

extern "C"
AdaShadowTensor*
tensor_reshape(
    AdaShadowTensor* src,
    int64_t* dims,
    int64_t ndim,
    ada_c_error_type* err)
{
    try {

        auto t =
            src->tensor.reshape(
                make_dims(dims, ndim));

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 10. zeros_like
//

extern "C"
AdaShadowTensor*
tensor_zeros_like(
    AdaShadowTensor* src,
    ada_c_error_type* err)
{
    try {

        auto t =
            torch::zeros_like(
                src->tensor);

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 11. arange
//

extern "C"
AdaShadowTensor*
new_tensor_arange(
    int64_t start,
    int64_t end,
    int64_t step,
    ada_c_error_type* err)
{
    try {

        auto t =
            torch::arange(
                start,
                end,
                step);

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

//
// 12. linspace
//

extern "C"
AdaShadowTensor*
new_tensor_linspace(
    double start,
    double end,
    int64_t steps,
    ada_c_error_type* err)
{
    try {

        auto t =
            torch::linspace(
                start,
                end,
                steps);

        return new (std::nothrow)
            AdaShadowTensor(t);

    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}
