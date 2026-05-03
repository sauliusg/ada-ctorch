// Expoerts:
#include <ada_c_error_code_helpers.h>

// uses:
#include <ada_c_error_codes.h>
#include <stdio.h>

extern "C" {

    void ada_propagate_error (ada_c_error_type *e,
                              const char *exception_text,
                              const char *function_name,
                              int errcode)
    {
        char message [4096];
        snprintf (message, sizeof(message), "(%s \"%s\") - \"%s\"",
                  "forwarded from", function_name,
                  exception_text);
        message [sizeof(message) - 4] = '.';
        message [sizeof(message) - 3] = '.';
        message [sizeof(message) - 2] = '.';

        message [sizeof(message) - 1] = '\0';
        ada_set_error_code (e, errcode);
        ada_set_error_message (e, message);
    }
    
}
