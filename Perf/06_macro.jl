using BenchmarkTools

function poly_naive(x, a...)
    p = zero(x)
    for i = 1:length(a)
        p = p + a[i] * x^(i-1)
    end
    return p
end

function poly_horner(x, a...)
    b = zero(x)
    for i = length(a):-1:1
        b = a[i] + b * x
    end
    return b
end

macro horner(x, p...)
    ex = esc(p[end])
    for i = length(p)-1:-1:1
        ex = :(muladd(t, $ex, $(esc(p[i]))))
    end
    Expr(:block, :(t = $(esc(x))), ex)
end

x = 3.5
f_naive(x) = poly_naive(x, 1,2,3,4,5,6,7,8,9)
f_horner(x) = poly_horner(x, 1,2,3,4,5,6,7,8,9)
f_horner_macro(x) = @horner(x, 1,2,3,4,5,6,7,8,9)

@btime f_naive(x);
@btime f_horner(x);
@btime f_horner_macro(x);


