module RestrictedBoltzmannMachinesHDF5

using HDF5: h5open
using RestrictedBoltzmannMachines: RBM, Binary, Potts, xReLU
using StandardizedRestrictedBoltzmannMachines: StandardizedRBM

# Version of the file format used to save/load RBMs
const FILE_FORMAT_VERSION = v"1.0.0"

# Header used to identify the file format in the HDF5 file structure
const FILE_FORMAT_HEADER = "rbm_hdf5_file_format_version"

include("generic_load.jl")
include("layers.jl")
include("rbm.jl")
include("std.jl")

include("potts_gumbel.jl")

end # module
