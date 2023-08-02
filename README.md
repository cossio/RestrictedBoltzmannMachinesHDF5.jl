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

## Citation

If you use this package in a publication, please cite:

* Jorge Fernandez-de-Cossio-Diaz, Simona Cocco, and Remi Monasson. "Disentangling representations in Restricted Boltzmann Machines without adversaries." [Physical Review X 13, 021003 (2023)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.13.021003).

Or you can use the [CITATION.bib](https://github.com/cossio/RestrictedBoltzmannMachines.jl/blob/master/CITATION.bib) file.