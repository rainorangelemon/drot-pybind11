cmake_minimum_required(VERSION 3.6)
find_package(CUDA REQUIRED)
find_package(PythonInterp 3.6 REQUIRED)
find_package(PythonLibs 3.6 REQUIRED)

include_directories(
    ${PYTHON_INCLUDE_DIRS}
    ./pybind11/include
    )

link_directories(
    /usr/local/cuda/lib64
    )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

cuda_add_library(fast_ot SHARED
  fast_ot.cu)

target_link_libraries(fast_ot
  ${PYTHON_LIBRARIES}
  cudart)

set_target_properties(fast_ot PROPERTIES PREFIX "")