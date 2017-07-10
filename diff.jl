function Differentiate(f, x)
    h = 1e-06
    return (f(x+h)-f(x-h))/2h
end

function f(x)
    return x^2
end

function main()
    x = 0
    print(Differentiate(f, x)," ", Differentiate(sin, x), " ",Differentiate(exp, x), Differentiate(log, x))
end

main()
