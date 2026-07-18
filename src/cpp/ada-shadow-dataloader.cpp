#include "ada-shadow-dataloader.hpp"

typedef torch::data::Iterator<torch::data::Example<>> example_iterator_t;
    
struct AdaShadowIteratorHolder {

    example_iterator_t it;

    AdaShadowIteratorHolder(const example_iterator_t& iter)
        : it(iter),
          refcount(1)
    {
    }

    void add_reference()
    {
        ++refcount;
    }

    bool release_reference()
    {
        return (--refcount) == 0;
    }

private:

    std::atomic_size_t refcount{1};
};


AdaShadowIteratorHolder*
new_ada_shadow_iterator_holder(
    torch::data::Iterator<torch::data::Example<>> iterator)
{
    return new AdaShadowIteratorHolder(iterator);
}


extern "C"
void
delete_ada_shadow_data_loader(
    AdaShadowDataLoader* loader)
{
    delete loader;
}
