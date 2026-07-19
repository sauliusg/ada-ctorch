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
    
auto make_mnist_dataset_normalised_and_stacked(const std::string& path,
                                               double x, double y)
{
    return torch::data::datasets::MNIST(path)
        .map(torch::data::transforms::Normalize<>(x, y))
        .map(torch::data::transforms::Stack<>());
}


using MNISTNormalisedStackedDatasetType =
    decltype(
        make_mnist_dataset_normalised_and_stacked
            (std::declval<const std::string&>(),
             std::declval<double>(),
             std::declval<double>()
            ));

// We can also create MNISTNormalisedStackedDatasetType from the
// pre-existing data types:
    
MNISTNormalisedStackedDatasetType
make_mnist_dataset_normalised_and_stacked(MNISTDatasetType &ds,
                                          double x, double y)
{
    return ds
        .map(torch::data::transforms::Normalize<>(x, y))
        .map(torch::data::transforms::Stack<>());
}
    
MNISTNormalisedStackedDatasetType
make_mnist_dataset_normalised_and_stacked(MNISTNormalisedDatasetType &ds)
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
// Concrete implementations of the class AdaShadowDataset
// descendants, so that we can present the template-expanded MNIST
// dataset types using run-time polymorphism:

// Normalised dataset:

class AdaShadowMNISTNormalisedDataset final
    : public AdaShadowDataset
{
private:

    MNISTNormalisedDatasetType dataset_;

public:

    explicit AdaShadowMNISTNormalisedDataset(const std::string& path,
                                             double x, double y):
        dataset_(make_mnist_dataset_normalised(path, x, y))
    {}

    explicit AdaShadowMNISTNormalisedDataset(MNISTDatasetType &ds,
                                             double x, double y):
        dataset_(make_mnist_dataset_normalised(ds, x, y))
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
        throw std::invalid_argument("Only Stack<>() transformed datasets can "
                                    "currently produce loaders. "
                                    "This is just a Normalized MNIST dataset.");
    };

}; // class

// Stacked dataset:

class AdaShadowMNISTStackedDataset final
    : public AdaShadowDataset
{
private:

    MNISTStackedDatasetType dataset_;

public:

    explicit AdaShadowMNISTStackedDataset(const std::string& path):
        dataset_(make_mnist_dataset_stacked(path))
    {}

    explicit AdaShadowMNISTStackedDataset(MNISTDatasetType& ds):
        dataset_(make_mnist_dataset_stacked(ds))
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

// Normalised and stacked:

class AdaShadowMNISTNormalisedStackedDataset final
    : public AdaShadowDataset
{
private:

    MNISTNormalisedStackedDatasetType dataset_;

public:

    explicit AdaShadowMNISTNormalisedStackedDataset
    (const std::string& path, double x, double y):
        dataset_(make_mnist_dataset_normalised_and_stacked(path, x, y))
    {}

    explicit AdaShadowMNISTNormalisedStackedDataset
    (MNISTDatasetType& ds, double x, double y):
        dataset_(make_mnist_dataset_normalised_and_stacked(ds, x, y))
    {}

    explicit AdaShadowMNISTNormalisedStackedDataset
    (MNISTNormalisedDatasetType& ds):
        dataset_(make_mnist_dataset_normalised_and_stacked(ds))
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

// "Raw" dataset:

class AdaShadowMNISTDataset final
    : public AdaShadowDataset
{
private:

    MNISTDatasetType dataset_;

public:

    explicit AdaShadowMNISTDataset(const std::string& path):
        dataset_(make_mnist_dataset(path))
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
        throw std::invalid_argument("Only Stack<>() transformed datasets can "
                                    "currently produce loaders. "
                                    "This is just a \"raw\" MNIST dataset.");
    };

    virtual AdaShadowDataset*
    normalize(float mean, float std)
    {
        return new AdaShadowMNISTNormalisedDataset (dataset_, mean, std);
    }


    virtual AdaShadowDataset*
    stack()
    {
        return new AdaShadowMNISTStackedDataset (dataset_);
    }    
    
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

        return new AdaShadowMNISTNormalisedStackedDataset(path, x, y);
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
