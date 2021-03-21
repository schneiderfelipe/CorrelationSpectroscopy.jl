"""
    synchronous(A::AbstractMatrix)

Calculate a synchronous two-dimensional correlation spectrum.

`A` is a dataset with multiple spectra in rows.
They don't need to be at equally spaced measurements of the perturbation.
Normally, the data is given as the difference from a reference spectrum (see
below).

# Examples
```jldoctest
julia> A = rand(50, 1000);

julia> Φ = synchronous(A .- mean(A, dims=1));

julia> size(Φ)
(1000, 1000)
```
"""
function synchronous(A::AbstractMatrix)
    return A'A / (size(A, 1) - 1)
end
