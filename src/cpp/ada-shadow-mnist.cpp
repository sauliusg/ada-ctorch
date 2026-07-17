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
 * Forward declaration of the iterator holder creation helpers.
 *
 * The actual implementation is in the iterator source file.
 */
extern AdaShadowIteratorHolder*
new_ada_shadow_iterator_holder(
    torch::data::Iterator<torch::data::Example<>> iterator);


/*
 * Concrete MNIST dataset type.
 *
 * All template details remain private to this compilation unit.
 */


namespace
{

auto make_mnist_dataset(const std::string& path)
{
    return torch::data::datasets::MNIST(path)
        .map(
            torch::data::transforms::Normalize<>(0.1307, 0.3081))
        .map(
            torch::data::transforms::Stack<>());
}


using MNISTDatasetType =
    decltype(
        make_mnist_dataset(
            std::declval<const std::string&>()));


using MNISTSequentialLoaderType =
    decltype(
        torch::data::make_data_loader<
            torch::data::samplers::SequentialSampler>(
                std::declval<MNISTDatasetType>(),
                std::declval<std::size_t>()));


using MNISTRandLoaderType =
    decltype(
        torch::data::make_data_loader<
            torch::data::samplers::RandomSampler>(
                std::declval<MNISTDatasetType>(),
                std::declval<std::size_t>()));


class AdaShadowMNISTDataLoader final
    : public AdaShadowDataLoader
{
private:

    std::unique_ptr<MNISTSequentialLoaderType> sequential_loader_;

    std::unique_ptr<MNISTRandLoaderType> random_loader_;


public:

    /*
     * Exactly one of the two pointers is initialized.
     */

    explicit AdaShadowMNISTDataLoader(
        std::unique_ptr<MNISTSequentialLoaderType> loader)
        :
        sequential_loader_(std::move(loader))
    {
    }


    explicit AdaShadowMNISTDataLoader(
        std::unique_ptr<MNISTRandLoaderType> loader)
        :
        random_loader_(std::move(loader))
    {
    }


    Ada_DataLoader_Code
    kind() const override
    {
        if (sequential_loader_)
            return ADA_DATALOADER_SEQUENTIAL;

        if (random_loader_)
            return ADA_DATALOADER_RANDOM;

        return ADA_DATALOADER_INVALID;
    }


    AdaShadowIteratorHolder*
    new_ada_shadow_iterator_start() override
    {
        if (sequential_loader_)
            return new_ada_shadow_iterator_holder((*sequential_loader_)->begin());

        if (random_loader_)
            return new_ada_shadow_iterator_holder((*random_loader_)->begin());

        throw std::runtime_error(
            "Invalid MNIST data loader state");
    }


    AdaShadowIteratorHolder*
    new_ada_shadow_iterator_end() override
    {
        if (sequential_loader_)
            return new_ada_shadow_iterator_holder((*sequential_loader_)->end());

        if (random_loader_)
            return new_ada_shadow_iterator_holder((*random_loader_)->end());

        throw std::runtime_error(
            "Invalid MNIST data loader state");
    }
};



class AdaShadowMNISTDataset final
    : public AdaShadowDataset
{
private:

    MNISTDatasetType dataset_;


public:

    explicit AdaShadowMNISTDataset(
        const std::string& path)
        :
        dataset_(make_mnist_dataset(path))
    {
    }


    AdaShadowDataLoader*
    new_ada_shadow_data_loader(
        const AdaDataLoaderOptions& options) override
    {
        switch (options.sampler_kind)
        {
        case ADA_DATALOADER_SEQUENTIAL:
        {
            auto loader =
                torch::data::make_data_loader<
                    torch::data::samplers::SequentialSampler>(
                        std::move(dataset_),
                        options.batch_size);

            return new AdaShadowMNISTDataLoader(std::move(loader));
        }


        case ADA_DATALOADER_RANDOM:
        {
            auto loader =
                torch::data::make_data_loader<
                    torch::data::samplers::RandomSampler>(
                        std::move(dataset_),
                        options.batch_size);

            return new AdaShadowMNISTDataLoader(
                std::move(loader));
        }


        default:

            throw std::runtime_error(
                "Unsupported MNIST sampler");
        }
    }
};


} // anonymous namespace



/*
 * Ada ABI functions
 */


extern "C"
AdaShadowDataset*
new_ada_shadow_mnist_dataset(
    const char* path,
    ada_c_error_type* err)
{
    try
    {
        assert(path);

        return new AdaShadowMNISTDataset(path);
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


extern "C"
void
delete_ada_shadow_data_loader(
    AdaShadowDataLoader* loader)
{
    delete loader;
}
