// exports:
#include "ada-shadow-dataloader.hpp"

// ses:
#include <ada_c_error_code_helpers.h>
#include <ada_dataloader_codes.h>

typedef torch::data::Iterator<torch::data::Example<>> example_iterator_t;
    
struct AdaShadowIteratorHolder {

    example_iterator_t it;

    AdaShadowIteratorHolder(const example_iterator_t& iter)
        : it(iter),
          refcount(1)
    {
    }

    void inc_reference()
    {
        ++refcount;
    }

    bool release_reference()
    {
        assert (refcount > 0);
        return (--refcount) == 0;
    }

private:

    std::atomic_size_t refcount{1};
};

extern "C"
void
ada_shadow_iterator_holder_release_reference (AdaShadowIteratorHolder* iter)
{
    assert (iter);
    if (iter->release_reference()) {
        delete iter;
    }
}

extern "C"
void
ada_shadow_iterator_holder_inc_reference (AdaShadowIteratorHolder* iter)
{
    assert (iter);
    iter->inc_reference();
}


AdaShadowIteratorHolder*
new_ada_shadow_iterator_holder (torch::data::Iterator<torch::data::Example<>> iterator)
{
    return new AdaShadowIteratorHolder(iterator);
}

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
