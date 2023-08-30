import Aqua
import RestrictedBoltzmannMachinesHDF5

using Test: @testset

@testset "aqua" begin
    Aqua.test_all(
        RestrictedBoltzmannMachinesHDF5;
        ambiguities=(exclude=[reshape],)
    )
end
