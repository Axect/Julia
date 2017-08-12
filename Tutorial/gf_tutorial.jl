# Gadfly Tutorial

using Gadfly, DataFrames, Distributions

function Sample()
    x = 0:0.1:2π;
    y1 = sin.(x);
    y2 = cos.(x);
    return x, y1, y2
end

function Work()
    # Receive Sample
    (x, y1, y2) = Sample()

    # Generate Normal Distrib
    d = Normal(0, 1)
    y1_new = y1 .+ rand(d, length(y1)) ./ 10
    y2_new = y2 .+ rand(d, length(y2)) ./ 10

    # Make Full Y
    y = vcat(y1_new, y2_new)

    # Make DataFrame
    df = DataFrame(X=repeat(x, outer=[2]), Y=y, index=repeat(["sin", "cos"], inner=[length(y1)]))
    writetable("Tutorial/Data/sincos.csv", df)

    # Plotting
    pl = plot(df, x=:X, y=:Y, color=:index, Geom.point, Geom.smooth, Guide.XLabel("X"), Guide.YLabel("Y"), Guide.title("Gadfly Tutorial"))
    draw(SVG("Tutorial/Fig/gadfly_tut.svg", 1000px, 600px), pl)
end