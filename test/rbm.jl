using Test: @testset, @test
using RestrictedBoltzmannMachines: RBM, Binary, Spin, Potts, Gaussian, xReLU
using RestrictedBoltzmannMachinesHDF5: save_rbm, load_rbm

@testset "rbm" begin
    rbm = RBM(Potts(; θ=randn(2,3)), Binary(; θ=randn(4)), randn(2,3,4))
    path = save_rbm(tempname(), rbm)
    loaded_rbm = load_rbm(path)

    @test loaded_rbm.visible isa Potts
    @test loaded_rbm.hidden isa Binary

    @test loaded_rbm.w == rbm.w
    @test loaded_rbm.visible.θ == rbm.visible.θ
    @test loaded_rbm.hidden.θ == rbm.hidden.θ
end

@testset "layers" begin
    for Layer in (Binary, Spin, Potts)
        rbm = RBM(Layer(; θ=randn(2,3)), xReLU(; θ=randn(4), γ=randn(4), Δ=randn(4), ξ=randn(4)), randn(2,3,4))
        path = save_rbm(tempname(), rbm)
        loaded_rbm = load_rbm(path)

        @test loaded_rbm.visible isa Layer
        @test loaded_rbm.hidden isa xReLU

        @test loaded_rbm.w == rbm.w
        @test loaded_rbm.visible.θ == rbm.visible.θ
        @test loaded_rbm.hidden.θ == rbm.hidden.θ
        @test loaded_rbm.hidden.γ == rbm.hidden.γ
        @test loaded_rbm.hidden.Δ == rbm.hidden.Δ
        @test loaded_rbm.hidden.ξ == rbm.hidden.ξ
    end
end

@testset "Gaussian" begin
    rbm = RBM(Binary(; θ=randn(2,3)), Gaussian(; θ=randn(4), γ=randn(4)), randn(2,3,4))
    path = save_rbm(tempname(), rbm)
    loaded_rbm = load_rbm(path)

    @test loaded_rbm.visible isa Binary
    @test loaded_rbm.hidden isa Gaussian

    @test loaded_rbm.w == rbm.w
    @test loaded_rbm.visible.θ == rbm.visible.θ
    @test loaded_rbm.hidden.θ == rbm.hidden.θ
    @test loaded_rbm.hidden.γ == rbm.hidden.γ
end
