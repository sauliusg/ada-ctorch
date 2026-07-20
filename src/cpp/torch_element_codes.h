#ifndef _TORCH_ELEMENT_CODES_H_
#define _TORCH_ELEMENT_CODES_H_

#include <stdint.h>

/*
 * Stable ABI enumeration of PyTorch tensor element types.
 * These values MUST remain fixed forever once published,
 * as they are part of the Ada/C++ ABI contract.
 */

typedef int32_t Torch_Element_Code;

typedef enum
{
    TORCH_ELEMENT_INVALID = -1,

    /* Boolean */
    TORCH_ELEMENT_BOOL = 0,

    /* Integer types */
    TORCH_ELEMENT_INT8  = 1,
    TORCH_ELEMENT_UINT8 = 2,

    TORCH_ELEMENT_INT16 = 3,
    TORCH_ELEMENT_INT32 = 4,
    TORCH_ELEMENT_INT64 = 5,

    /* Floating-point types */
    TORCH_ELEMENT_FLOAT16  = 6,
    TORCH_ELEMENT_BFLOAT16 = 7,

    TORCH_ELEMENT_FLOAT32 = 8,
    TORCH_ELEMENT_FLOAT64 = 9,

    /* Complex types */
    TORCH_ELEMENT_COMPLEX32  = 10,  /* half precision complex */
    TORCH_ELEMENT_COMPLEX64  = 11,  /* float complex */
    TORCH_ELEMENT_COMPLEX128 = 12   /* double complex */

} Torch_Element_Code_Enum;

#endif /* _TORCH_ELEMENT_CODES_H_ */
