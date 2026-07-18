#ifndef ADA_CTORCH_SHADOW_DATALOADER_HPP_
#define ADA_CTORCH_SHADOW_DATALOADER_HPP_

#include <torch/torch.h>

#include "ada_dataloader_codes.h"

/*
 * Forward declarations.
 */

struct AdaShadowIteratorHolder;

// FIXME: to be removed when AdaShadowIteratorHolder gets its own
// header (S.G.)

/*
 * Forward declaration of the iterator holder creation helpers.
 *
 * The actual implementation is in the iterator source file.
 */
extern AdaShadowIteratorHolder*
new_ada_shadow_iterator_holder(
    torch::data::Iterator<torch::data::Example<>> iterator);

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

/*
 * Generic implementation of an AdaShadowDataLoader.
 *
 * The template parameter is the concrete libtorch loader type
 * (typically a std::unique_ptr<StatelessDataLoader<....>> returned by
 * torch::data::make_data_loader(....)).
 *
 * This class is purely an implementation detail of the C++ binding.
 * It is never exposed through the Ada ABI.
 */

template<class LoaderType>
class AdaShadowDataLoaderImpl final
    : public AdaShadowDataLoader
{
private:

    LoaderType loader_;

    Ada_DataLoader_Code kind_;

public:

    explicit
    AdaShadowDataLoaderImpl(
        LoaderType loader,
        Ada_DataLoader_Code kind)
        :
        loader_(std::move(loader)),
        kind_(kind)
    {
    }

    virtual
    ~AdaShadowDataLoaderImpl() override = default;


    Ada_DataLoader_Code
    kind() const override
    {
        return kind_;
    }


    AdaShadowIteratorHolder*
    new_ada_shadow_iterator_start() override
    {
        return
            new_ada_shadow_iterator_holder
                (
                    loader_->begin()
                );
    }


    AdaShadowIteratorHolder*
    new_ada_shadow_iterator_end() override
    {
        return
            new_ada_shadow_iterator_holder
                (
                    loader_->end()
                );
    }
};

#endif /* ADA_CTORCH_SHADOW_DATALOADER_HPP_ */
