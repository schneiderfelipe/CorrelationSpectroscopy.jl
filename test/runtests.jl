using CorrelationSpectroscopy
using Test

using Gtk  # https://github.com/JuliaPlots/VisualRegressionTests.jl/issues/30
using LinearAlgebra
using Plots
using Statistics
using VisualRegressionTests

"""
    demodata()

Calculate a demo dataset.

The demo dataset consists of fifteen signals at specific intervals, with peaks
at 10 and 20 rising in intensity, whereas peaks at 30 and 40 are decreasing in
intensity.
The example was inpired by this [one](https://en.wikipedia.org/wiki/Two-dimensional_correlation_analysis#Properties_of_2D_correlation_analysis>).

This function might go into the main code in the future if there is demand.

# Examples
```jldoctest
julia> x, data = demodata();

julia> length(x)
500

julia> size(data)
(15, 500)
```
"""
function demodata()
    n = 15
    x = range(0, 50, length=500)

    a₀ = 0.175
    A₁(n) = a₀ + 0.0125exp(-(n - 7)^2) + ((0.2375 - a₀) - exp(-0.8(n + 2.5)))
    A₂(n) = a₀ - 0.037exp(-0.2(n - 7)^2) + 1.025(0.2375 - a₀) / (1 + exp(-(n - 7)))
    A₃(n) = a₀*exp(-0.17(n -1)) + 0.0045(n - 1)
    A₄(n) = a₀ + 0.03exp(-0.3(n - 6)^2) - 1.6(0.2375 - a₀) / (1 + exp(-(n - 7)))

    σ = 2.0
    data = [
        A₁(t) * gaussian(xᵢ, 10, σ) +
        A₂(t) * gaussian(xᵢ, 20, σ) +
        A₃(t) * gaussian(xᵢ, 30, σ) +
        A₄(t) * gaussian(xᵢ, 40, σ) +
        0.02 * gaussian(xᵢ, 25, 10σ) +
        0.001 * randn()
        for t in 1:n, xᵢ in x
    ]

    return x, data
end
gaussian(x, μ=0.0, σ=1.0) = exp(-((x - μ) / σ)^2)

@testset "CorrelationSpectroscopy.jl" begin
    include("test_nodahilbert.jl")
    include("test_demodata.jl")
    include("test_synchronous.jl")
    include("test_asynchronous.jl")
end
