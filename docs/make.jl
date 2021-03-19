using CorrelationSpectroscopy
using Documenter

DocMeta.setdocmeta!(CorrelationSpectroscopy, :DocTestSetup, :(using CorrelationSpectroscopy); recursive=true)

makedocs(;
    modules=[CorrelationSpectroscopy],
    authors="Felipe S. S. Schneider <schneider.felipe@posgrad.ufsc.br> and contributors",
    repo="https://github.com/schneiderfelipe/CorrelationSpectroscopy.jl/blob/{commit}{path}#{line}",
    sitename="CorrelationSpectroscopy.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://schneiderfelipe.github.io/CorrelationSpectroscopy.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/schneiderfelipe/CorrelationSpectroscopy.jl",
)
