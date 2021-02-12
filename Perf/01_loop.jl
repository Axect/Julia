using BenchmarkTools

function sumsqrtn(n)
    r = 0
    for i = 1:n
        r += sqrt(i)
    end
    return r
end

function sumsqrtn_fixed(n)
    r = 0.0
    for i = 1:n
        r += sqrt(i)
    end
    return r
end

function simdsum(x)
    s = 0
    @simd for v in x
        s += v
    end
    return s
end

function simdsum_fixed(x)
    s = zero(eltype(x))
    @simd for v in x
        s += v
    end
    return s
end

@btime sumsqrtn(1000_000)

@btime sumsqrtn_fixed(1000_000)

a = rand(Float32, 10^6)

@btime simdsum(a)

@btime simdsum_fixed(a)

