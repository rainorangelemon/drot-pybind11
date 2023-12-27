# DROT-PyBind11
The PyBind11 version for Douglas-Rachford Splitting for Optimal Transport

## Installation

```bash
# create conda environment
$ conda create -n fastot python=3.9
$ conda activate fastot

# install conda packages
$ conda install -c conda-forge pot matplotlib
$ conda install scipy numpy

# cmake, replace the cuda location with yours
$ cmake -DCMAKE_CUDA_COMPILER=/usr/local/cuda-11.7/bin/nvcc
$ make
```

## Examples

```python
# generate data
dim = 2
n_sample = 1000

samples0 = multivariate_normal.rvs(np.zeros((dim,)), np.eye(dim), size=n_sample).reshape(-1, dim)
samples1 = multivariate_normal.rvs(np.ones((dim,)), np.eye(dim), size=n_sample).reshape(-1, dim)

C = cdist(samples0, samples1)

# run drot
p = np.ones((C.shape[0],)) * 1 / C.shape[0]
q = np.ones((C.shape[1],)) * 1 / C.shape[1]
stepsize = 2. / sum(C.shape)
maxiters = 100000
eps = 1e-2

result = fast_ot.drot(C, p, q, C.shape[0], C.shape[1], stepsize, maxiters, eps, False, True)
print(result.fval)
```
Check the complete example in [example.ipynb](./example.ipynb)

## Comments

The motivation of this repo: see whether this new method is a good replacement for `ot.emd2`. It turns out that it isn't (at least for this version). Even for small samples, `ot.emd2` is still faster than the current code. 

With `eps=1e-5` and `n=10000`, the current code would require 100 seconds to converge, while `ot.emd2` takes less than 10 seconds.

## Acknowledgement

- [DROT](https://github.com/vienmai/drot/tree/main)
- [PyBind11-CUDA](https://github.com/PWhiddy/pybind11-cuda/tree/master)
- [PyBind/cmake_example](https://github.com/pybind/cmake_example/)
