cmake_minimum_required(VERSION 3.4...3.18)

project(fast_ot LANGUAGES CXX CUDA)

find_package(CUDA REQUIRED)
find_package(pybind11 REQUIRED)
# find_package(PythonInterp 3.6 REQUIRED)
# find_package(PythonLibs 3.6 REQUIRED)

pybind11_add_module(fast_ot fast_ot.cu)

# link_directories(
#     /usr/local/cuda/lib64
#     )

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# cuda_add_library(fast_ot SHARED fast_ot.cu)

# target_link_libraries(fast_ot ${PYTHON_LIBRARIES} cudart)

# set_target_properties(fast_ot PROPERTIES PREFIX "")