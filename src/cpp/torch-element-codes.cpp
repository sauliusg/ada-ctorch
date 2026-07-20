#include <stdexcept>

#include <torch/torch.h>

#include "ada_c_error_code_helpers.h"
#include "tensors.h"
#include "torch_element_codes.h"

extern "C"
Torch_Element_Code
tensor_element_type_code (AdaShadowTensor *Src,
                          ada_c_error_type *Err)
{
    try {
        if (Src == nullptr) {
            throw std::invalid_argument
                ("tensor_element_type_code: null tensor handle");
        }

        switch (Src->tensor.scalar_type()) {
        case torch::kBool:
            return TORCH_ELEMENT_BOOL;

        case torch::kInt8:
            return TORCH_ELEMENT_INT8;

        case torch::kUInt8:
            return TORCH_ELEMENT_UINT8;

        case torch::kInt16:
            return TORCH_ELEMENT_INT16;

        case torch::kInt32:
            return TORCH_ELEMENT_INT32;

        case torch::kInt64:
            return TORCH_ELEMENT_INT64;

        case torch::kFloat16:
            return TORCH_ELEMENT_FLOAT16;

        case torch::kBFloat16:
            return TORCH_ELEMENT_BFLOAT16;

        case torch::kFloat32:
            return TORCH_ELEMENT_FLOAT32;

        case torch::kFloat64:
            return TORCH_ELEMENT_FLOAT64;

        case torch::kComplexHalf:
            return TORCH_ELEMENT_COMPLEX32;

        case torch::kComplexFloat:
            return TORCH_ELEMENT_COMPLEX64;

        case torch::kComplexDouble:
            return TORCH_ELEMENT_COMPLEX128;

        default:
            throw std::runtime_error
                ("unsupported PyTorch tensor scalar type");
        }
    }
    catch (...) {
        handle_exception (Err, __FUNCTION__);
        return TORCH_ELEMENT_INVALID;
    }
}
