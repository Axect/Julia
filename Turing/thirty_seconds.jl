using Turing, StatsPlots, Random

p_true = 0.5

Ns = 0:100

Random.seed!(12)
data = rand(Bernoulli(p_true), last(Ns))

@model function coinflip(y)
    p ~ Beta(1, 1)

    N = length(y)
    for n in 1:N
        y[n] ~ Bernoulli(p)
    end
end

iterations = 1000
ϵ = 0.05
τ = 10

chain = sample(coinflip(data), HMC(ϵ, τ), iterations)

histogram(chain[:p])