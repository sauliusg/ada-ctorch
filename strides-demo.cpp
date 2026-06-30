#include <ATen/Tensor.h>
#include <ATen/Functions.h>
#include <iostream>

int main() {
    at::Tensor t = at::rand({2,3,4});
    auto s = t.strides(); // Returns IntArrayRef
    for (auto stride : s) std::cout << stride << " ";
    std::cout << std::endl;
}
