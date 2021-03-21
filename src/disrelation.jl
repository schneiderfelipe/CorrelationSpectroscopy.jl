"""
    disrelation(A::AbstractMatrix)

Calculate a disrelation two-dimensional correlation spectrum.

`A` is a dataset with multiple spectra in rows.
They don't need to be at equally spaced measurements of the perturbation.
Normally, the data is given as the difference from a reference spectrum (see
below).

# Examples
```jldoctest
julia> A = rand(50, 1000);

julia> Λ = disrelation(A .- mean(A, dims=1));

julia> size(Λ)
(1000, 1000)
```
"""
function disrelation(A::AbstractMatrix)
    Φ = synchronous(A)
    Λ = similar(Φ)

    n = size(Λ, 1)
    for ν₁ in 1:n, ν₂ in 1:n
        Λ[ν₁, ν₂] = √(Φ[ν₁, ν₁] * Φ[ν₂, ν₂] - Φ[ν₁, ν₂]^2)
    end
    return Λ
end
