#include <vector>
#include <string>
#include <iostream>
#include "drot.hpp"
#include "reader.hpp"

int main(int argc, char *argv[]) {
    if (argc != 6) {
        std::cerr << "Usage: " << argv[0] << " input_file output_file nrows ncols maxiters\n";
        return 1;
    }

    const std::string input_file = argv[1];
    const std::string output_file = argv[2];
    const int nrows = std::stoi(argv[3]);
    const int ncols = std::stoi(argv[4]);
    const int maxiters = std::stoi(argv[5]);

    auto C = utility::load<float>(input_file, nrows, ncols);
    std::vector<float> p(nrows, 1/(float) nrows);
    std::vector<float> q(ncols, 1/(float) ncols);

    const float stepsize = 2/(float) (nrows + ncols);
    const float eps = 0.0f;

    const bool verbose = true;
    const bool log = true;

    drot(&C[0], &p[0], &q[0], nrows, ncols, stepsize, maxiters, eps, verbose, log, output_file);

    return 0;
}