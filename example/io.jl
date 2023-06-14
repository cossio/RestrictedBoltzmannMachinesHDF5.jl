using RestrictedBoltzmannMachines: RBM, Potts, Binary, xReLU
using RestrictedBoltzmannMachinesHDF5: save_rbm, load_rbm

rbm = RBM(Potts(; θ=randn(2,3)), Binary(; θ=randn(4)), randn(2,3,4))
path = save_rbm(tempname(), rbm)
loaded_rbm = load_rbm(path)

rbm = RBM(Potts(; θ=randn(2,3)), xReLU(; θ=randn(4), γ=randn(4), Δ=randn(4), ξ=randn(4)), randn(2,3,4))
path = save_rbm(tempname(), rbm)
loaded_rbm = load_rbm(path)
