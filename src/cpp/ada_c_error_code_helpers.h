#ifndef _ADA_C_ERROR_CODE_HELPERS_H_
#define _ADA_C_ERROR_CODE_HELPERS_H_

#include <ada_c_error_codes.h>

extern "C" {

    // The 'ada_propagate_error' constructs a message using a static
    // buffer for an extended C++ error message (S.G.):

    void
    propagate_error (ada_c_error_type *e,
                     const char *exception_text,
                     const char *function_name,
                     int errcode);

    /* The helper function to be called in C++ "glue" functions
       catch{} blocks to transfer the complete C++ exception
       information to Ada: */
    
    void
    handle_exception(ada_c_error_type* err,
                     const char* function_name);

}

#endif
