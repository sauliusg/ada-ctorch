#ifndef ADA_SHADOW_ITERATOR_HPP_
#define ADA_SHADOW_ITERATOR_HPP_

// uses:
#include <torch/torch.h>


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

AdaShadowIteratorHolder*
new_ada_shadow_iterator_holder(example_iterator_t iterator);

#endif
