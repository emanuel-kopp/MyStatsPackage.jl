#---
"""
    rse_sum(V::Vector)

Return the sum of the vector elements

# Arguments

- `V` -- Vector

# Output

A real number representing the sum of the vector elements

# Notes
This is an exercise and the notes don't make much sense. 

# Examples
```julia-repl
julia> rse_sum(1:36)
666
julia> rse_sum([3, 4, 7, 9])
23
\````

See also [`sum`](@ref)

"""
function rse_sum(x)
    @assert all(!isnan, x) "NaN present in data"
    +(x...)
end

rse_sum(1:36) == 666

#---
function rse_mean(x)
    rse_sum(x) / length(x)
end

rse_mean(-15:17) == 1

#---
function rse_std(x)
    sqrt(sum((x .- rse_mean(x)) .^ 2) / (length(x) - 1))
end

rse_std(1:3)

#---
function rse_tstat(x; σ = rse_std(x))
    rse_mean(x) / (σ / sqrt(length(x)))
end

rse_tstat(2:3)
rse_tstat(2:3, σ = 4)

# ---

struct StatResult2
    x::Vector
    n::Int64
    std::Float64
    tvalue::Float64
end

function StatResult2(x)
    n = length(x)
    std = rse_std(x)
    tvalue = rse_tstat(x)
    return StatResult2(x, n, std, tvalue)
end

StatResult2(2:10)

import Base.length
function length(x::StatResult2)
    return x.n
end

length(StatResult2(2:15))

#---

function printOwner()
    println("My GitHub user name is: emanuel-kopp")
end
