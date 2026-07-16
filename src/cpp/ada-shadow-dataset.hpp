#ifndef _ADA_CTORCH_SHADOW_DATASET_HPP_
#define _ADA_CTORCH_SHADOW_DATASET_HPP_

#include <cstddef>
#include <stdexcept>

/*
 * Forward declarations.
 *
 * Concrete definitions are intentionally hidden.
 */
struct AdaShadowBatch;
struct AdaShadowTensor;


/*
 * Abstract C++ facade for datasets.
 *
 * Ada code only sees opaque handles to this hierarchy.
 *
 * Concrete implementations (MNIST, CIFAR, Ada-defined datasets, ...)
 * derive from this class and contain the actual libtorch template
 * instantiations.
 */
class AdaShadowDataset
{
public:

    virtual ~AdaShadowDataset() = default;

    /*
     * Number of samples in the dataset.
     *
     * Throws if the dataset has no defined size.
     */
    virtual std::size_t size() const = 0;

    /*
     * Retrieve a single sample.
     *
     * The exact representation of a sample is hidden behind
     * AdaShadowBatch.
     */
    virtual AdaShadowBatch*
    new_batch(std::size_t index) const = 0;

    /*
     * Dataset transformations.
     *
     * Default implementations deliberately fail.
     * Derived classes override supported transformations.
     */

    virtual AdaShadowDataset*
    normalize(float mean, float std) const
    {
        throw std::runtime_error("Normalize transformation is not supported by this dataset");
    }


    virtual AdaShadowDataset*
    stack() const
    {
        throw std::runtime_error("Stack transformation is not supported by this dataset");
    }
};

#endif // ADA_CTORCH_SHADOW_DATASET_HPP
