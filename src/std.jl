_load_rbm(path::AbstractString, ::Val{:StandardizedRBM}) = h5open(path, "r") do file
    offset_v = read(file, "offset_v")
    offset_h = read(file, "offset_h")
    scale_v = read(file, "scale_v")
    scale_h = read(file, "scale_h")
    w = read(file, "weights")
    visible = construct_layer(read(file, "visible_type"), read(file, "visible_par"))
    hidden = construct_layer(read(file, "hidden_type"), read(file, "hidden_par"))
    return StandardizedRBM(visible, hidden, w, offset_v, offset_h, scale_v, scale_h)
end

function save_rbm(path::AbstractString, rbm::StandardizedRBM; overwrite::Bool=false)
    if !overwrite && isfile(path)
        error("File already exists: $path")
    end
    h5open(path, "w") do file
        write(file, FILE_FORMAT_HEADER, string(FILE_FORMAT_VERSION))
        write(file, "rbm_type", "StandardizedRBM")
        write(file, "weights", rbm.w)
        write(file, "visible_par", rbm.visible.par)
        write(file, "hidden_par", rbm.hidden.par)
        write(file, "visible_type", layer_type(rbm.visible))
        write(file, "hidden_type", layer_type(rbm.hidden))
        write(file, "offset_v", rbm.offset_v)
        write(file, "offset_h", rbm.offset_h)
        write(file, "scale_v", rbm.scale_v)
        write(file, "scale_h", rbm.scale_h)
    end
    return path
end
