function hello(x::Array{T, N}) where {T <: Number, N}
    println("Dimension: $N\nData: $x")
end

hello([1,2,3])

hello([1 2;3 4])
