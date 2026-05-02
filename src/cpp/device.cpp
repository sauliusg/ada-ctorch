// uses:
#include <torch/torch.h>
#include <tensors.h>
#include <assert.h>

extern "C" {

    // This C++ binder does not declare its own class; instead it
    // allocates and retuers a pointer directly to an allocated
    // torch::Device object.

    torch::Device*
    new_torch_device (c10::DeviceType tp, c10::DeviceIndex idx)
    {
        return new (std::nothrow) torch::Device (tp, idx);
    }
    
    void
    delete_torch_device (torch::Device* dev)
    {
        delete dev;
    }

    void
    shadow_tensor_to_device(AdaShadowTensor *tensor, torch::Device* device)
    {
        assert(tensor);
        assert(device);
        tensor->to(*device);
    }
    
};  // extern "C"
