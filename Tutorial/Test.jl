function f1(a, b, inc, iter)
    for i = 1:iter
        A = [a:inc:b]
    end
end

function f2(a, b, inc, iter)
    A = Array{Float64}(length(a:inc:b))
    for i = 1:iter
        A = [a:inc:b]
    end
end

function f3(a, b, inc, iter)
    A = Array{Float64}(length(a:inc:b))
    for i = 1:iter
        A[:] = a:inc:b
    end
end