#ifndef _TORCH_DATASETS_H_
#define _TORCH_DATASETS_H_

#include <torch/torch.h>

typedef torch::data::datasets::MapDataset<
            torch::data::datasets::MNIST,
            torch::data::transforms::Normalize<>
        > mnist_normalised_dataset_t;

typedef torch::data::datasets::MapDataset<
            torch::data::datasets::MapDataset<
                torch::data::datasets::MNIST,
                torch::data::transforms::Normalize<>
            >,
            torch::data::transforms::Stack<>
        > mnist_stacked_dataset_t;

#endif
