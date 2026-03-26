// uses:
#include <torch/torch.h>
#include <torch-nn-module.h>
#include <assert.h>
#include <ada_c_error_codes.h>

struct AdaShadowConv2d;

extern "C" void
call_conv2d_forward_method (torch::Tensor ret, struct AdaShadowConv2d *layer,
                            torch::Tensor x, ada_c_error_type *err)
{
    try {
        torch::nn::Conv2d *l = (torch::nn::Conv2d*)layer;
        ret = (*l)->forward (x);
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
