/* exports: */
#include <manual_seed.h>

/* uses: */

#include <torch/torch.h>

extern "C" {

    void torch_manual_seed (unsigned long seed)
    {
        torch::manual_seed (seed);
    }
    
};
