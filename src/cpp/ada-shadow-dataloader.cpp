// exports:
#include "ada-shadow-dataloader.hpp"

// ses:
#include <ada_c_error_code_helpers.h>
#include <ada_dataloader_codes.h>

/*
 * Ada ABI functions
 */

extern "C"
void
delete_ada_shadow_data_loader(AdaShadowDataLoader* loader)
{
    delete loader;
}


extern "C"
AdaShadowIteratorHolder*
new_ada_shadow_iterator_start(AdaShadowDataLoader *loader,
                              ada_c_error_type* err)
{
    try {
        assert(loader);
        return loader->new_ada_shadow_iterator_start();
    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

extern "C"
AdaShadowIteratorHolder*
new_ada_shadow_iterator_end(AdaShadowDataLoader *loader,
                            ada_c_error_type* err)
{
    try {
        assert(loader);
        return loader->new_ada_shadow_iterator_end();
    }
    catch (...) {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

// Advancing and checking iterators:
    
extern "C"
void
advance_iterator(AdaShadowIteratorHolder* holder)
{
    assert(holder);
    ++(holder->it);
}

extern "C"
int8_t
iterators_are_equal(AdaShadowIteratorHolder* h1,
                    AdaShadowIteratorHolder* h2)
{
    assert(h1);
    assert(h2);
    return (h1->it) == (h2->it);
}
