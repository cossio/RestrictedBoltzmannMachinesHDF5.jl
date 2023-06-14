# TODO: move this code to PottsGumbelRBMLayers.jl, after this package is registered
using PottsGumbelRBMLayers: PottsGumbel

layer_type(::PottsGumbel) = "PottsGumbel"
construct_layer(::Val{:PottsGumbel}, par::AbstractArray) = PottsGumbel(par)
