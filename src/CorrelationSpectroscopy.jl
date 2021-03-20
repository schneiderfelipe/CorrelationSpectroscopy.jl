module CorrelationSpectroscopy

using ToeplitzMatrices: Toeplitz

export NodaHilbert, N
export synchronous

include("nodahilbert.jl")
include("synchronous.jl")

end
