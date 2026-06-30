#ifndef _ADA_C_ERROR_CODES_H_
#define _ADA_C_ERROR_CODES_H_

struct ada_c_error_type;

typedef struct ada_c_error_type ada_c_error_type;

/* Ada procedures to be called from C(++): */

extern "C" {

    // The following two functions are defined on the Ada side and
    // ensure correct transfer of data to the Ada-managed memory:

    void ada_set_error_code (ada_c_error_type *e, int code);

    void ada_set_error_message (ada_c_error_type *e, char *message);

}

#endif
