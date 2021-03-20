"""
    synchronous(data::AbstractMatrix)

Calculate a synchronous two-dimensional correlation spectrum.

`data` is a dataset with multiple spectra in rows.
They don't need to be at equally spaced measurements of the perturbation.
Normally, the data is given as the difference from a reference spectrum (see
below).

# Examples
```jldoctest
julia> data = rand(50, 1000);

julia> syn = synchronous(data .- mean(data, dims=1));

julia> size(syn)
(1000, 1000)
```
"""
function synchronous(data::AbstractMatrix)
    return data'data / (size(data, 1) - 1)
end
