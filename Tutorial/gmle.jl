using Distributions

function Genmle()
  d = Normal(3,1)
  x = rand(d, 300, 2);
  μ = Vector{Float64}(2)
  for i = 1:2
    μ[i] = mean(x[:,i])
  end
  x_new = Array{Float64}(300, 2)
  for i = 1:2
    x_new[:,i] = x[:,i].-μ[i]
  end
  Σ = 1/299.*(x_new'*x_new)
  println("Mean=", μ)
  println("Cov=", Σ)
  println("Original Cov=", cov(x))
end
