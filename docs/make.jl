using Documenter
using MyStatsPackage

makedocs(
    sitename = "MyStatsPackage.jl",
    modules = [MyStatsPackage],
    pages = Any[
        "Home" => "index.md"
    ],
)