#ifndef ADA_CTORCH_SHADOW_DATALOADER_HPP_
#define ADA_CTORCH_SHADOW_DATALOADER_HPP_

#include "ada_dataloader_codes.h"

/*
 * Forward declarations.
 */

struct AdaShadowIteratorHolder;

/*
 * Abstract façade for libtorch data loaders.
 *
 * Concrete subclasses hide all template instantiations from
 * the Ada/C++ ABI. Ada manipulates opaque pointers to this
 * class exclusively.
 */
class AdaShadowDataLoader
{
public:

    virtual
    ~AdaShadowDataLoader() = default;

    /*
     * Returns the sampling strategy implemented by this loader.
     */
    virtual Ada_DataLoader_Code
    kind() const = 0;

    /*
     * Creates a newly allocated iterator positioned at the
     * beginning of the loader.
     *
     * Ownership of the returned object belongs to the caller.
     */
    virtual AdaShadowIteratorHolder*
    new_ada_shadow_iterator_start() = 0;

    /*
     * Creates a newly allocated end iterator.
     *
     * Ownership of the returned object belongs to the caller.
     */
    virtual AdaShadowIteratorHolder*
    new_ada_shadow_iterator_end() = 0;
};

#endif /* ADA_CTORCH_SHADOW_DATALOADER_HPP_ */
