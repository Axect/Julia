using Distributions, Gadfly, DataFrames

# Sample Generate
function Sample(n::Int64)
    # Normal Distrib
    dx1, dx2 = Normal(2, 1), Normal(-2, 1);
    dy1, dy2 = Normal(0, 3), Normal(0, 3);

    # Pick Sample
    x1, x2 = rand(dx1, n), rand(dx2, n)
    y1, y2 = rand(dy1, n), rand(dy2, n)

    # Prepare for DataFrame
    c1, c2 = hcat(x1, y1), hcat(x2, y2)
    x, y = vcat(x1, x2), vcat(y1, y2)

    return c1, c2, x, y
end

function main()
    n = 150;
    c1, c2, x, y = Sample(n);

    # Make DataFrame
    DF = DataFrame(X=x, Y=y, index = repeat(["c1", "c2"], inner = [length(c1[:, 1])]))

    # Make mean vector & Cov Matrix
    μ1, μ2 = Array{Float64}(2), Array{Float64}(2);
    for i = 1:length(μ1)
        μ1[i] = mean(c1[:, i]);
        μ2[i] = mean(c2[:, i]);
    end
    Σ = cov(c1)

    # LDA
    a = inv(Σ) * (μ1 - μ2);
    b = -0.5 .* (μ1' * inv(Σ) * μ1 - μ2' * inv(Σ) * μ2);
    println("a=", a)
    println("b=", b)
    L(x) = -a[1] / a[2] * x

    # Make DataFrame
    r1, r2 = round(minimum(x) - 1), round(maximum(x) + 1);
    T = r1:0.01:r2;
    DF2 = DataFrame(X=T, Y=L(T), index=repeat(["lda"], inner=[length(T)]))

    # Plot
    pl =  plot(
        layer(DF, x=:X, y=:Y, color=:index, Geom.point),
        layer(DF2, x=:X, y=:Y, color=:index, Geom.line),
        Coord.Cartesian(xmin=r1, xmax=r2, ymin=-7, ymax=7),
        Guide.title("Linear Discriminant"),
    )
    draw(SVG("ML/lda/Fig/lda.svg", 1000px, 600px), pl);
end
