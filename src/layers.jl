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
    elseif layer_type == "PottsGumbel"
        return PottsGumbel(par)
    else
        throw(ArgumentError("Unsupported layer type: $layer_type"))
    end
end
