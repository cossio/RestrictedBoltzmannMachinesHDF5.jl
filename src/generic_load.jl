"""
    load_rbm(path)

Load an RBM from an HDF5 file at `path`.
"""
load_rbm(path::AbstractString) = h5open(path, "r") do file
    format_version = read(file, FILE_FORMAT_HEADER)
    if format_version == string(FILE_FORMAT_VERSION)
        rbm_type = read(file, "rbm_type")
        if rbm_type == "RBM"
            _load_rbm(path)
        elseif rbm_type == "StandardizedRBM"
            _load_standardized_rbm(path)
        else
            error("Unknown RBM type: $rbm_type")
        end
    else
        error("Unsupported format version: $format_version")
    end
end
