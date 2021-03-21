module CorrelationSpectroscopy

using ToeplitzMatrices: Toeplitz

export NodaHilbert, N
export synchronous, asynchronous, disrelation

# TODO: support 2D correlation spectra for distinct spectra.
include("nodahilbert.jl")
include("synchronous.jl")
include("asynchronous.jl")
include("disrelation.jl")

end
