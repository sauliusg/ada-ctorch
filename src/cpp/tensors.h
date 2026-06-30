#ifndef _TENSORS_H
#define _TENSORS_H

#include <torch/torch.h>

struct AdaShadowTensor {
    
    // Shadow tensors can be shared between the Ada variables,
    // reference counted and copied to an unshared copy if a
    // modification is required. The 'refcount' will keep track of how
    // many Ada variables have reference to the given tensor:

    torch::Tensor tensor;

    AdaShadowTensor () {}

    AdaShadowTensor (torch::Tensor& t) : tensor(t) {}

};

#endif
