using CorrelationSpectroscopy
using Test

@testset "CorrelationSpectroscopy.jl" begin
    include("test_nodahilbert.jl")
    include("test_synchronous.jl")
    include("test_asynchronous.jl")
end
