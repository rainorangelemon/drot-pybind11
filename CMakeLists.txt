cmake_minimum_required(VERSION 3.4...3.18)

project(fast_ot LANGUAGES CXX CUDA)

find_package(CUDA REQUIRED)
find_package(pybind11 REQUIRED)

pybind11_add_module(fast_ot fast_ot.cu)