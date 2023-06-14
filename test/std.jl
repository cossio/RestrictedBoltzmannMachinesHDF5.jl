using Test: @testset, @test
using RestrictedBoltzmannMachinesHDF5: save_rbm, load_rbm
using RestrictedBoltzmannMachines: RBM, Binary, xReLU
using StandardizedRestrictedBoltzmannMachines: StandardizedRBM, standardize

@testset "std" begin
    rbm = standardize(RBM(Binary(; θ=randn(2,3)), xReLU(; θ=randn(4), γ=randn(4), Δ=randn(4), ξ=randn(4)), randn(2,3,4)))
    rbm.offset_v .= randn.()
    rbm.offset_h .= randn.()
    rbm.scale_v .= randn.()
    rbm.scale_h .= randn.()

    path = save_rbm(tempname(), rbm)
    loaded_rbm = load_rbm(path)

    @test loaded_rbm.visible isa Binary
    @test loaded_rbm.hidden isa xReLU

    @test loaded_rbm.w == rbm.w

    @test loaded_rbm.visible.θ == rbm.visible.θ

    @test loaded_rbm.hidden.θ == rbm.hidden.θ
    @test loaded_rbm.hidden.γ == rbm.hidden.γ
    @test loaded_rbm.hidden.Δ == rbm.hidden.Δ
    @test loaded_rbm.hidden.ξ == rbm.hidden.ξ

    @test loaded_rbm.offset_v == rbm.offset_v
    @test loaded_rbm.offset_h == rbm.offset_h
    @test loaded_rbm.scale_v == rbm.scale_v
    @test loaded_rbm.scale_h == rbm.scale_h
end
