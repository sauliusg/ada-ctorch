#ifndef _TENSORS_H
#define _TENSORS_H

#include <torch/torch.h>

struct AdaShadowTensor : torch::Tensor {
    
    // Shadow tensors can be shared between the Ada variables,
    // reference counted and copied to an unshared copy if
    // modification is required. The 'refcount' will keep track of how
    // many Ada variables have reference to the given tensor:
    
    int refcount;
    
    AdaShadowTensor () : refcount(1) {}

    AdaShadowTensor (torch::Tensor t) : torch::Tensor(t), refcount(1) {}

};

#endif
