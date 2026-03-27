#ifndef _TORCH_LOADERS_H_
#define _TORCH_LOADERS_H_

#include <torch/torch.h>

typedef std::unique_ptr<
            torch::data::StatelessDataLoader<
                torch::data::datasets::MapDataset<
                    torch::data::datasets::MapDataset<
                        torch::data::datasets::MNIST,
                        torch::data::transforms::Normalize<>
                    >,
                    torch::data::transforms::Stack<torch::data::Example<>>
                >,
                torch::data::samplers::SequentialSampler
            >,
            std::default_delete<
                torch::data::StatelessDataLoader<
                    torch::data::datasets::MapDataset<
                        torch::data::datasets::MapDataset<
                            torch::data::datasets::MNIST,
                            torch::data::transforms::Normalize<>
                        >,
                        torch::data::transforms::Stack<torch::data::Example<>>
                    >,
                    torch::data::samplers::SequentialSampler
                >
            >
        >
    mnist_data_loader_sequential_sampler_t;

#endif
