// uses:
#include <torch/torch.h>
#include <torch-nn-module.h>
#include <assert.h>

struct AdaShadowConv2d;

extern "C" void
call_conv2d_forward_method (torch::Tensor ret, struct AdaShadowConv2d *layer,
                            torch::Tensor x)
{
    torch::nn::Conv2d *l = (torch::nn::Conv2d*)layer;
    ret = (*l)->forward (x);
}
