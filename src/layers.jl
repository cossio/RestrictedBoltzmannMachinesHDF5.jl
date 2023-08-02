layer_type(::Binary) = "Binary"
layer_type(::Spin) = "Spin"
layer_type(::Potts) = "Potts"
layer_type(::Gaussian) = "Gaussian"
layer_type(::xReLU) = "xReLU"

construct_layer(layer_type::AbstractString, par::AbstractArray) = construct_layer(Val(Symbol(layer_type)), par)

construct_layer(::Val{:Binary}, par::AbstractArray) = Binary(par)
construct_layer(::Val{:Spin}, par::AbstractArray) = Spin(par)
construct_layer(::Val{:Potts}, par::AbstractArray) = Potts(par)
construct_layer(::Val{:Gaussian}, par::AbstractArray) = Gaussian(par)
construct_layer(::Val{:xReLU}, par::AbstractArray) = xReLU(par)
