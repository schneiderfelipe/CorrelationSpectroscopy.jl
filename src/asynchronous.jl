"""
    asynchronous(A::AbstractMatrix)

Calculate a asynchronous two-dimensional correlation spectrum.

`A` is a dataset with multiple spectra in rows.
They *need* to be at equally spaced measurements of the perturbation.
Normally, the data is given as the difference from a reference spectrum (see
below).

# Examples
```jldoctest
julia> A = rand(50, 1000);

julia> Ψ = asynchronous(A .- mean(A, dims=1));

julia> size(Ψ)
(1000, 1000)
```
"""
function asynchronous(A::AbstractMatrix)
    return A' * (N * A) / (size(A, 1) - 1)
end
