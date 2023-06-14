layer_type(::Binary) = "Binary"
layer_type(::Potts) = "Potts"
layer_type(::xReLU) = "xReLU"

function construct_layer(layer_type::AbstractString, par::AbstractArray)
    if layer_type == "Binary"
        return Binary(par)
    elseif layer_type == "Potts"
        return Potts(par)
    elseif layer_type == "xReLU"
        return xReLU(par)
    else
        throw(ArgumentError("Unknown layer type: $layer_type"))
    end
end
