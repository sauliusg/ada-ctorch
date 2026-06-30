// Expoerts:
#include <ada_c_error_code_helpers.h>

// uses:
#include <torch/torch.h> // needed for the c10 namespace
#include <ada_c_error_codes.h>
#include <stdio.h>

extern "C" {

    typedef enum {
        ada_c_err_c10 = 10,
        ada_c_err_std = 11,
        ada_c_err_any = 12,

        ada_c_err_last
    } ada_c_error_code_t;

    // Construct error messages using static char[] buffers and call
    // Ada-side subroutines ("ada_set_error_code", etc.) to fill all
    // necessary exception information on the Ada side, then
    // return. Ada can the decide how to handle this error information
    // (possibly by raising an appropriate Ada exception):
    
    void propagate_error (ada_c_error_type *e,
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

    //
    // Exception handling helper – re-throws an exceptions and handles
    // it by filling Ada-side data structure (this is what
    // "propagae_error" does):
    //

    void
    handle_exception(ada_c_error_type* err,
                     const char* function_name)
    {
        try {
            throw;
        }
        catch (const c10::Error& e) {
            propagate_error(err, e.what(), function_name, ada_c_err_c10);
        }
        catch (const std::exception& e) {
            propagate_error(err, e.what(), function_name, ada_c_err_std);
        }
        catch (...) {
            propagate_error(err, "Unknown C++ exception", function_name,
                            ada_c_err_any);
        }
    }
    
}
