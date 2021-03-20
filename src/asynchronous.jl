"""
    asynchronous(data::AbstractMatrix)

Calculate a asynchronous two-dimensional correlation spectrum.

`data` is a dataset with multiple spectra in rows.
They *need* to be at equally spaced measurements of the perturbation.
Normally, the data is given as the difference from a reference spectrum (see
below).

# Examples
```jldoctest
julia> data = rand(50, 1000);

julia> asyn = asynchronous(data .- mean(data, dims=1));

julia> size(asyn)
(1000, 1000)
```
"""
function asynchronous(data::AbstractMatrix)
    return data' * (N * data) / (size(data, 1) - 1)
end
