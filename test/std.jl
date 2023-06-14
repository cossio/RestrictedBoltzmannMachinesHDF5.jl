using Test: @testset, @test
using RestrictedBoltzmannMachinesHDF5: save_rbm, load_rbm
using RestrictedBoltzmannMachines: RBM, Binary
using StandardizedRestrictedBoltzmannMachines: StandardizedRBM, standardize

@testset "std" begin
    rbm = standardize(RBM(Binary(; θ=randn(2,3)), Binary(; θ=randn(4)), randn(2,3,4)))
    path = save_rbm(tempname(), rbm)
    loaded_rbm = load_rbm(path)
    @test loaded_rbm.w == rbm.w
    @test loaded_rbm.offset_v == rbm.offset_v
    @test loaded_rbm.offset_h == rbm.offset_h
end
