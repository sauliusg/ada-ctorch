// exports:
#include <ada-shadow-dataset.hpp>

//uses:
#include <ada_c_error_code_helpers.h>
#include <assert.h>

/*
 * Ada ABI functions
 */

extern "C"
AdaShadowDataLoader*
new_ada_shadow_data_loader(
    AdaShadowDataset* dataset,
    std::size_t batch_size,
    Ada_DataLoader_Code sampler_kind,
    ada_c_error_type* err)
{
    try
    {
        assert(dataset);
        
        AdaDataLoaderOptions options
            (
             batch_size,
             // The below conversion works since the Ada side
             // Ada_DataLoader_Code values which we get here are
             // automatically derived from the explicit
             // Ada_DataLoader_Code_Enum values in the C header,
             // converted to and .ads file:
             (Ada_DataLoader_Code_Enum) sampler_kind
            );

        return dataset->new_ada_shadow_data_loader(options);
    }
    catch (...)
    {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}

extern "C"
AdaShadowDataset*
new_ada_shadow_normalised_dataset(
    AdaShadowDataset* dataset,
    double x, double y,
    ada_c_error_type* err)
{
    try
    {
        assert(dataset);
        return dataset->normalize(x, y);
    }
    catch (...)
    {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}


extern "C"
AdaShadowDataset*
new_ada_shadow_stacked_dataset(
    AdaShadowDataset* dataset,
    ada_c_error_type* err)
{
    try
    {
        assert(dataset);
        return dataset->stack();
    }
    catch (...)
    {
        handle_exception(err, __FUNCTION__);
        return nullptr;
    }
}


// Binding to destructor:

extern "C"
void
delete_ada_shadow_dataset(AdaShadowDataset* dataset, ada_c_error_type* err)
{
    try
    {
        delete dataset;
    }
    catch (...)
    {
        handle_exception(err, __FUNCTION__);
    }
}
