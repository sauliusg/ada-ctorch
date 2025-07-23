#include <torch/torch.h>

using namespace std;

auto main() -> int {
  torch::manual_seed(1);
  cout << "Random number generator initialised" << endl;
}
