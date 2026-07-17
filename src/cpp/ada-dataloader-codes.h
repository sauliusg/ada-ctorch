#ifndef _ADA_DATALOADER_CODES_H_
#define _ADA_DATALOADER_CODES_H_

#include <stdint.h>

/*
 * Stable ABI enumeration describing the sampling strategy used
 * by an AdaShadowDataLoader.
 *
 * These numeric values are part of the Ada/C++ ABI and MUST NOT
 * change once published.
 */

typedef int32_t Ada_DataLoader_Code;

typedef enum
{
    ADA_DATALOADER_INVALID = -1,

    /*
     * Samples are presented in dataset order.
     */
    ADA_DATALOADER_SEQUENTIAL = 0,

    /*
     * Samples are presented in pseudo-random order.
     */
    ADA_DATALOADER_RANDOM = 1

} Ada_DataLoader_Code_Enum;

#endif /* _ADA_DATALOADER_CODES_H_ */
