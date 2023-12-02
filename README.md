# RestrictedBoltzmannMachinesHDF5 Julia package

Save and load [Restricted Boltzmann machine](https://github.com/cossio/RestrictedBoltzmannMachines.jl) objects as [HDF5](https://github.com/JuliaIO/HDF5.jl) files.

## Installation

This package is registered. Install with:

```julia
import Pkg
Pkg.add("RestrictedBoltzmannMachinesHDF5")
```

## Example

```julia
using RestrictedBoltzmannMachines: RBM, Binary # from https://github.com/cossio/RestrictedBoltzmannMachines.jl
using RestrictedBoltzmannMachinesHDF5: save_rbm, load_rbm # from this package
rbm = RBM(Binary(; θ=randn(2,3)), Binary(; θ=randn(4)), randn(2,3,4)) # create an RBM
path = save_rbm(tempname(), rbm) # save RBM to a temporary path
loaded_rbm = load_rbm(path) # load RBM from saved file
```

## Related

[RestrictedBoltzmannMachines.jl](https://github.com/cossio/RestrictedBoltzmannMachines.jl) package, which defines the `RBM` object.