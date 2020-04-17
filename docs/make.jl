using ExercismRepresenter
using Documenter

makedocs(;
    modules=[ExercismRepresenter],
    authors="Sascha Mann <git@mail.saschamann.eu>",
    repo="https://github.com/SaschaMann/ExercismRepresenter.jl/blob/{commit}{path}#L{line}",
    sitename="ExercismRepresenter.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://SaschaMann.github.io/ExercismRepresenter.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/SaschaMann/ExercismRepresenter.jl",
)
