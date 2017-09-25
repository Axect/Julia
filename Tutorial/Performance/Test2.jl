f = x -> x^2 + 2x + 3
g(x) = x^2 + 2x + 3

function h1(x)
    return x^2 + 2x +3
end

function h2(x::Int)::Int
    return x^2 + 2x + 3
end

function FFunc()
    A = zeros(Int, 10^8)
    for i=1:length(A)
        A[i] = f(i)
    end
	return A
end

function GFunc()
    A = zeros(Int, 10^8)
    for i=1:length(A)
        A[i] = g(i)
    end
	return A
end

function H1Func()
    A = zeros(Int, 10^8)
    for i=1:length(A)
        A[i] = h1(i)
    end
	return A
end

function H2Func()
    A = zeros(Int, 10^8)
    for i=1:length(A)
        A[i] = h2(i)
    end
    return A
end
