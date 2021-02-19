using BenchmarkTools, SharedArrays, Distributed

a = Array{Float64}(undef, 1000_000)

function sequential_alloc(a::Vector{T}) where T <: Number
    for i = 1:1000_000
        a[i] = i
    end
end

@btime sequential_alloc($a)

b = SharedArray{Float64}(1000_000)

function parallel_alloc(b::SharedArray{T}) where T <: Number
    @distributed for i in 1:1000_000
        b[i] = i
    end
end

@btime parallel_alloc($b)


