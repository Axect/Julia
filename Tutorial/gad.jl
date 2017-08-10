using Gadfly, DataFrames, Distributions

# Create Sample
function Sample(n::Int64)::Array{Float64}
    x = 0 + 1 * randn(n)
    return x
end

# Guess mean & std by sample
function Guess(n::Int64)::Tuple{Float64,Float64}
    μ_ml = mean(Sample(n))
    σ_ml = std(Sample(n))
    return μ_ml, σ_ml
end

function main()
    T = -4:0.01:4
    d1 = Normal(0, 1)
    yt1 = pdf(d1, T)
    for i = 1:4
        n = 10^i
        x1 = rand(d1, n)
        yx1 = pdf(d1, x1)
        μ_ml, σ_ml = Guess(n)
        d2 = Normal(μ_ml, σ_ml)
        x2 = rand(d2, n)
        yt2 = pdf(d2, T)
        yx2 = pdf(d2, x2)
        yt1 = vcat(yt1, yt2)
    end
    df = DataFrame(T=repeat(-4:0.01:4, outer=[5]), Y = yt1, C=repeat(["normal", "n_10", "n_100", "n_1000", "n_10000"], inner=[length(-4:0.01:4)]))
    myplot = plot(df, x=:T, y=:Y, color=:C, Geom.line, Guide.XLabel("Χ"), Guide.YLabel("Y"), Guide.title("σ"))
    draw(SVG("Tutorial/Fig/Test.svg", 1000px, 600px), myplot)
end