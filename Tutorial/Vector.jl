mutable struct Vector
    x::Float64
    y::Float64
    z::Float64
end

function Norm(V::Vector)
    return sqrt(V.x^2 + V.y^2 + V.z^2)    
end

function main()
    A = Vector(1., 2., 3.)
    println(A.x)
    A.x = 2.
    println(A.x)
    print(Norm(A))
end