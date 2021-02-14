using BenchmarkTools

function string_zeros(s::AbstractString)
    n = 1000_000
    x = s=="Int64" ?
        Vector{Int64}(undef, n) :
        Vector{Float64}(undef, n)
    for i in 1:length(x)
        x[i] = 0
    end
    return x
end
    
function string_zeros_stable(s::AbstractString)
    n = 1000_000
    x = s=="Int64" ?
        Vector{Int64}(undef, n) :
        Vector{Float64}(undef, n)
    return fill_zeros(x)
end

function string_zeros_fixed(s::AbstractString)
    n = 1000_000
    x = s=="Int64" ?
        Vector{Int64}(undef, n) :
        Vector{Float64}(undef, n)
    return fill_zeros_fixed(x)
end

function fill_zeros(x)
    for i in 1:length(x)
        x[i] = 0
    end
    return x
end

function fill_zeros_fixed(x)
    for i in 1:length(x)
        x[i] = zero(eltype(x))
    end
    return x
end

@btime string_zeros("Int64");
@btime string_zeros_stable("Int64");
@btime string_zeros_fixed("Int64");
