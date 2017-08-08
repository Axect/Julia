using Plots

function main()
    x = [0:0.01:10...]

    f(x) = @. x^2
    g(x) = @. 10sin(x)
    h(x) = @. 10cos(x)

    p1 = plot(f, x)
    p2 = plot(g, x)
    p3 = plot(h, x)

    plot(p1, p2, p3, layout=(3,1), legend=false)
end
