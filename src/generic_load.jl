"""
    load_rbm(path)

Load an RBM from an HDF5 file at `path`.
"""
load_rbm(path::AbstractString) = h5open(path, "r") do file
    format_version = read(file, FILE_FORMAT_HEADER)
    if format_version == string(FILE_FORMAT_VERSION)
        rbm_type = read(file, "rbm_type")
        return _load_rbm(path, Val(Symbol(rbm_type)))
    else
        error("Unsupported format version: $format_version")
    end
end
