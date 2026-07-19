// epxports:
#include <ada-shadow-iterator.hpp>

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
