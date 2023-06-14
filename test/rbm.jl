using Test: @testset, @test
using RestrictedBoltzmannMachines: RBM, Binary
using RestrictedBoltzmannMachinesHDF5: save_rbm, load_rbm

@testset "rbm" begin
    rbm = RBM(Binary(; θ=randn(2,3)), Binary(; θ=randn(4)), randn(2,3,4))
    path = save_rbm(tempname(), rbm)
    loaded_rbm = load_rbm(path)
    @test loaded_rbm.w == rbm.w
    @test loaded_rbm.visible.θ == rbm.visible.θ
    @test loaded_rbm.hidden.θ == rbm.hidden.θ
end
