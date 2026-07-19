#include "ada-shadow-dataset.hpp"
#include "ada-shadow-dataloader.hpp"
//#include "ada-shadow-iterator.hpp"
#include <ada_c_error_code_helpers.h>
#include <ada_dataloader_codes.h>

#include <torch/torch.h>

#include <cassert>
#include <cstddef>
#include <memory>
#include <string>


/*
 * Concrete MNIST dataset type.
 *
 * All template details remain private to this compilation unit.
 */

namespace
{

// ------------------------------------------------------------------------
// The MNIST data set will be repesented in four different ways:
//
//    MMIST                  /* no transformations applied */
//    MMISTStacked           /* Stack<>() transformation applied */
//    MMISTNormalised        /* Normalise<>() transformation applied */
//    MMISTStackedNormalised /* Normalised then stacked */
//
//    Since in PyTorch C++ layer these transformations are implemented
//    as template instantiations, we define four maker functions and
//    four types automatically deribed from return values of these
//    functions.
    
// ------------------------------------------------------------------------
// MNIST -- the raw, untransformed dataset.
    
auto
make_mnist_dataset(const std::string& path)
{
    return torch::data::datasets::MNIST(path);
}

using MNISTDatasetType =
    decltype(make_mnist_dataset(std::declval<const std::string&>()));

// ------------------------------------------------------------------------
// MNISTStacked
    
auto
make_mnist_dataset_stacked(const std::string& path)
{
    return torch::data::datasets::MNIST(path)
        .map(torch::data::transforms::Stack<>());
}

using MNISTStackedDatasetType =
    decltype(make_mnist_dataset_stacked(std::declval<const std::string&>()));

MNISTStackedDatasetType
make_mnist_dataset_stacked(MNISTDatasetType& ds)
{
    return ds
        .map(torch::data::transforms::Stack<>());
}

// ------------------------------------------------------------------------
// MNISTNormalised
    
auto
make_mnist_dataset_normalised(const std::string& path,
                              double x, double y)
{
    return torch::data::datasets::MNIST(path)
        .map(torch::data::transforms::Normalize<>(x, y));
}

using MNISTNormalisedDatasetType =
    decltype(make_mnist_dataset_normalised
             (std::declval<const std::string&>(),
              std::declval<double>(),
              std::declval<double>()
             ));

MNISTNormalisedDatasetType
make_mnist_dataset_normalised(MNISTDatasetType& ds,
                              double x, double y)
{
    return ds
        .map(torch::data::transforms::Normalize<>(x, y));
}

// ------------------------------------------------------------------------
// MNISTStackedNormalised
    
auto make_mnist_dataset_normalise_and_stack(const std::string& path,
                                            double x, double y)
{
    return torch::data::datasets::MNIST(path)
        .map(torch::data::transforms::Normalize<>(x, y))
        .map(torch::data::transforms::Stack<>());
}


using MNISTNormalisedStackedDatasetType =
    decltype(
        make_mnist_dataset_normalise_and_stack
            (std::declval<const std::string&>(),
             std::declval<double>(),
             std::declval<double>()
            ));

// We can also create MNISTNormalisedStackedDatasetType from the
// pre-existing data types:
    
MNISTNormalisedStackedDatasetType
make_mnist_dataset_normalise_and_stack(MNISTDatasetType &ds,
                                       double x, double y)
{
    return ds
        .map(torch::data::transforms::Normalize<>(x, y))
        .map(torch::data::transforms::Stack<>());
}
    
MNISTNormalisedStackedDatasetType
make_mnist_dataset_normalise_and_stack(MNISTNormalisedDatasetType &ds)
{
    return ds
        .map(torch::data::transforms::Stack<>());
}

// -------------------------------------------------------------------------

template<typename DatasetType>
auto
make_mnist_sequential_loader(
    DatasetType dataset,
    std::size_t batch_size)
{
    return torch::data::make_data_loader<
        torch::data::samplers::SequentialSampler>
            (
                std::move(dataset),
                batch_size
            );
}

template<typename DatasetType>
auto
make_mnist_random_loader(
    DatasetType dataset,
    std::size_t batch_size)
{
    return
        torch::data::make_data_loader<
            torch::data::samplers::RandomSampler>
            (
                std::move(dataset),
                batch_size
            );
}
    
} // anonymous namespace

// -------------------------------------------------------------------------

class AdaShadowMNISTDataset final
    : public AdaShadowDataset
{
private:

    MNISTNormalisedStackedDatasetType dataset_;

public:

    explicit AdaShadowMNISTDataset(const std::string& path,
                                   double x, double y):
        dataset_(make_mnist_dataset_normalise_and_stack(path, x, y))
    {}

    virtual std::size_t size() const
    {
        auto s = dataset_.size();

        if (!s) {
            throw std::runtime_error("MNIST dataset has no defined size.");
        }
        
        return *s;
    }

    AdaShadowDataLoader*
    new_ada_shadow_data_loader(const AdaDataLoaderOptions& options) override
    {
        switch (options.sampler_kind)
            {
            case ADA_DATALOADER_SEQUENTIAL:
                {
                    auto loader =
                        make_mnist_sequential_loader
                        (
                         dataset_,
                         options.batch_size
                         );

                    return
                        new AdaShadowDataLoaderImpl<decltype(loader)>
                        (
                         std::move(loader),
                         options.sampler_kind
                         );
                }

            case ADA_DATALOADER_RANDOM:
                {
                    auto loader =
                        make_mnist_random_loader
                        (
                         dataset_,
                         options.batch_size
                         );

                    return
                        new AdaShadowDataLoaderImpl<decltype(loader)>
                        (
                         std::move(loader),
                         options.sampler_kind
                         );
                }
                
            default:
                throw std::invalid_argument("Unsupported MNIST sampler.");
            }
    };

}; // class


/*
 * Ada ABI functions
 */


extern "C"
AdaShadowDataset*
new_ada_shadow_mnist_dataset(
    const char* path,
    double x, double y,
    ada_c_error_type* err)
{
    try
    {
        assert(path);

        return new AdaShadowMNISTDataset(path, x, y);
    }
    catch (...)
    {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}


extern "C"
void
delete_ada_shadow_mnist_dataset(
    AdaShadowDataset* dataset)
{
    delete dataset;
}
