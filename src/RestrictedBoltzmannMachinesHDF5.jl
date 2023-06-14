module RestrictedBoltzmannMachinesHDF5

using HDF5: h5open
using RestrictedBoltzmannMachines: RBM, Binary, Potts, xReLU

include("io.jl")
include("layers.jl")

end # module
