#ifndef _ADA_CTORCH_SHADOW_DATASET_HPP_
#define _ADA_CTORCH_SHADOW_DATASET_HPP_

#include <cstddef>
#include <stdexcept>

#include <ada-dataloader-codes.h>

/*
  Ownership conventions:

  for a class or struct X:

  new_x()         returns a newly allocated object; caller owns it.
  delete_x()      destroys an owned object. // 
  create_x(X **)  requires *p == NULL; allocates into *p.
  dispose_x(X **) destroys *p and sets it to NULL.
  x_member()      returns borrowed references valid while the parent object exists.
 */

/*
 * Forward declarations.
 *
 * Concrete definitions are intentionally hidden.
 */
struct AdaShadowBatch;
struct AdaShadowTensor;

class AdaShadowDataLoader;

struct AdaDataLoaderOptions
{
    std::size_t batch_size;
    Ada_DataLoader_Code_Enum sampler_kind;
};

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
    new_ada_shadow_batch(std::size_t index) const = 0;


    /*
     * Create a data loader, say for ANN training or validation
     * purposes.
     */    
    virtual AdaShadowDataLoader*
    new_ada_shadow_data_loader(const AdaDataLoaderOptions&) = 0;
    
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

#endif // _ADA_CTORCH_SHADOW_DATASET_HPP_
