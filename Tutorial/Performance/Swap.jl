mutable struct Trinary
    a::Int64
    b::Int64
    c::Int64
end

function LeviCivita(T::Trinary)
    T.a, T.b, T.c = T.b, T.c, T.a
end

function main()
    T = Trinary(1, 2, 3)
    LeviCivita(T)
    print(T)
end