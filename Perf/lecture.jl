### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ ea303ab8-6f5e-11eb-0bce-0b95398e323f
using BenchmarkTools

# ╔═╡ 145dc83e-6f5d-11eb-3e2e-656e78a7fa5a
md"""
# Julia High-Performance
"""

# ╔═╡ df5500b0-6f5e-11eb-0e88-698371698753
md"""
## Benchmark Tools
"""

# ╔═╡ ecf44a0c-6f5e-11eb-0442-672b16178ac4
md"""
## 01. Loop

**Q. Implement below procedure as julia function:**

$\sum_{k=1}^n \sqrt{k}$
"""

# ╔═╡ 117c26ea-6f5f-11eb-23fd-fde982087cc5
function sumsqrtn(n)
    s = 0
    for k = 1:n
        s += sqrt(k)
    end
    return s
end

# ╔═╡ 1d98b6e6-6f5f-11eb-38a3-effcd41260dc
# Measure performance
@benchmark sumsqrtn(1000_000)

# ╔═╡ 8df223f4-6f60-11eb-1dad-af1d3e2df965


# ╔═╡ Cell order:
# ╟─145dc83e-6f5d-11eb-3e2e-656e78a7fa5a
# ╟─df5500b0-6f5e-11eb-0e88-698371698753
# ╠═ea303ab8-6f5e-11eb-0bce-0b95398e323f
# ╟─ecf44a0c-6f5e-11eb-0442-672b16178ac4
# ╠═117c26ea-6f5f-11eb-23fd-fde982087cc5
# ╠═1d98b6e6-6f5f-11eb-38a3-effcd41260dc
# ╠═8df223f4-6f60-11eb-1dad-af1d3e2df965
