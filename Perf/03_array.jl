using BenchmarkTools

a = Int64[1,2,3,4,5,6,7,8,9,10]
b = Number[1,2,3,4,5,6,7,8,9,10]

function arr_sumsqr(x::Array{T}) where T <: Number
    r = zero(T)
    for i = 1:length(x)
        r = r + x[i]^2
    end
    return r
end

@btime arr_sumsqr($a);
@btime arr_sumsqr($b);
