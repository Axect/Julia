using Dierckx
using Plots
gr()
function main()
    x = [0, 1, 2, 3, 4]
    y = [0, 1, 4, 9, 16]

    spl = Spline1D(x, y)
    t = [0:0.1:4...]

    plot(t, spl(t), size=(1000, 600))
    title!("Spline 1D")
    xlabel!("x")
    ylabel!("y")
    savefig("Tutorial/Test_gr.png")
end
