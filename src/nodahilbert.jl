@doc raw"""
    NodaHilbert{T<:AbstractFloat}

Noda-Hilbert transform.

The Noda-Hilbert transformation is a square, skew symmetric,
[Toeplitz matrix](https://en.wikipedia.org/wiki/Toeplitz_matrix)
with zero diagonal defined as follows:

```math
N_{ij}
    = \begin{cases}
        0                     & i \eq j
        \frac{1}{\pi (j - i)} & i \neq i \\
      \end{cases}
```

# Examples
```jldoctest
julia> N === NodaHilbert{Float64}()
true

julia> NodaHilbert{Float32}()
NodaHilbert{Float32}()

julia> N(3)
3×3 ToeplitzMatrices.Toeplitz{Float64,Complex{Float64}}:
 -0.0        0.31831   0.159155
 -0.31831   -0.0       0.31831
 -0.159155  -0.31831  -0.0
```
"""
# TODO: should we subtype AbstractMatrix?
struct NodaHilbert{T<:AbstractFloat} end
NodaHilbert() = NodaHilbert{Float64}()
const N = NodaHilbert()

# Elements progressively decrease in magnitude.
@inline function calcfirstcolumn(T, n, nmax=21_361_417)
    c = zeros(T, n)
    @inbounds for i in 1:min(n-1, nmax)
        c[i+1] = 1 / (π * i)
    end
    return c
end

"""
    (N::NodaHilbert)(n::Int)

Realize the Noda-Hilbert transform matrix of size `n`.

`n` is the number of rows (and columns) in resulting matrix.
"""
function (N::NodaHilbert{T})(n::Int) where {T}
    c = calcfirstcolumn(T, n)
    return Toeplitz(-c, c)
end

# TODO: probably improve the fact that it realizes an object every time?
Base.:*(N::NodaHilbert, A::AbstractArray) = N(size(A, 1)) * A
