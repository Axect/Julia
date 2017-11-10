# testVal = 1E+08

function mapTest(n::Int)::Array{Int} # 0.24 s
    A = map(x -> x^2, 1:n)
    return A
end

function reduceTest(n::Int)::Int # 0.05 s
    A = reduce(+, 1:n)
    return A
end

function forTest1(n::Int)::Array{Int} # 0.26 s
    A = Array{Int}(n)
    for i = 1:n
        A[i] = i^2
    end
    return A
end

function forTest2(n::Int)::Int # 0.015 s
    s = 0
    for i=1:n
        s += i
    end
    return s
end
