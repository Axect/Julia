# testVal = 1E+08

function mapTest(n::Int)::Array{Int} # 0.24 s
    A = map(x -> x^2, 1:n)
    return A
end

function reduceTest(n::Int)::Int # 0.005 s
    A = reduce(+, 1:n)
    return A
end

function foldlTest(n::Int)::Int # 0.011 s
    A = foldl(+, 1:n)
    return A
end


function forTest1(n::Int)::Array{Int} # 0.68 s
    A = zeros(n)
    for i = 1:n
        A[i] = i^2
    end
    return A
end

function forTest2(n::Int)::Int # 0.006 s
    s = 0
    for i=1:n
        s += i
    end
    return s
end

function sumTest(n::Int)::Int # 0.007 s
    sum(1:n)
end