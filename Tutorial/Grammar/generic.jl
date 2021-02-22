function hello(x::Array{T, N}) where {T <: Number, N}
    println("Dimension: $N\nData: $x")
end

hello([1,2,3])

hello([1 2;3 4])

struct Point{T, N}
    data::Array{T, N}
end

function Point(x::U) where {T <: Number, U <: AbstractRange{T}}
    return Point{T, 1}(collect(x))
end

p = Point([1,2,3])
q = Point(1:10)

println(p)
println(q)
