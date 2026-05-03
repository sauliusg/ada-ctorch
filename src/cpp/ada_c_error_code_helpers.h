#ifndef _ADA_C_ERROR_CODE_HELPERS_H_
#define _ADA_C_ERROR_CODE_HELPERS_H_

struct ada_c_error_type;

typedef struct ada_c_error_type ada_c_error_type;

/* Ada procedures to be called from C(++): */

extern "C" {

    // The 'ada_propagate_error' constructs a message using a static buffer:    

    void ada_propagate_error (ada_c_error_type *e,
                              const char *exception_text,
                              const char *function_name,
                              int errcode);

}

#endif
