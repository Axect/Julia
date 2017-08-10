const μ = 0.
const σ = 1.

# Create Sample
function Sample(n::Int64)::Array{Float64}
    x = μ + σ * randn(n)
    return x
end

# Guess mean & std by sample
function Guess(n::Int64)::Tuple{Float64,Float64}
    μ_ml = mean(Sample(n))
    σ_ml = std(Sample(n))
    return μ_ml, σ_ml
end

using Distributions
using Plots
gr()

function main()
    T = -4:0.01:4
    d1 = Normal(0, 1)
    yt1 = pdf(d1, T)
    p1 = plot(T, yt1, size=(1000, 600))
    title!("\\sigma")
    xlabel!("x")
    ylabel!("y")
    for i = 1:4
        n = 10^i
        x1 = rand(d1, n)
        yx1 = pdf(d1, x1)
        μ_ml, σ_ml = Guess(n)
        d2 = Normal(μ_ml, σ_ml)
        x2 = rand(d2, n)
        yt2 = pdf(d2, T)
        yx2 = pdf(d2, x2)
        plot!(T, yt2, label="n = $n")
    end
    savefig("Test.svg")
end
