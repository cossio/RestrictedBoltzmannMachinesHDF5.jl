_load_rbm(path::AbstractString, ::Val{:RBM}) = h5open(path, "r") do file
    w = read(file, "weights")
    visible = construct_layer(read(file, "visible_type"), read(file, "visible_par"))
    hidden = construct_layer(read(file, "hidden_type"), read(file, "hidden_par"))
    return RBM(visible, hidden, w)
end

"""
    save_rbm(path, rbm; overwrite=false)

Save an RBM to an HDF5 file at `path`. If `overwrite` is `false` (the default),
an error is thrown if the file already exists.
"""
function save_rbm(path::AbstractString, rbm::RBM; overwrite::Bool=false)
    if !overwrite && isfile(path)
        error("File already exists: $path")
    end
    h5open(path, "w") do file
        write(file, FILE_FORMAT_HEADER, string(FILE_FORMAT_VERSION))
        write(file, "rbm_type", "RBM")
        write(file, "weights", rbm.w)
        write(file, "visible_par", rbm.visible.par)
        write(file, "hidden_par", rbm.hidden.par)
        write(file, "visible_type", layer_type(rbm.visible))
        write(file, "hidden_type", layer_type(rbm.visible))
    end
    return path
end
