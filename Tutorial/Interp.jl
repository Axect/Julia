using Dierckx
using Plots

function main()
    x = [0, 1, 2, 3, 4]
    y = [0, 1, 4, 9, 16]

    spl = Spline1D(x, y)
    t = [0:0.1:4...]

    plot(t, spl(t))
    title!("Spline 1D")
    xlabel!("x")
    ylabel!("y")
    savefig("Tutorial/Test.png")
end
