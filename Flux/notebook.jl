### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ a87f27ea-8f12-11eb-34b4-176acc529b2d
using PlutoUI;

# ╔═╡ e0d372e4-8ef0-11eb-25d1-0d09d5c1e660
using Flux, BenchmarkTools, CUDA

# ╔═╡ e4b783de-8f16-11eb-1225-b3e0eda3e1fa
using Flux: params

# ╔═╡ d2f06a7c-8ef0-11eb-3e7e-0ff96dfe9e53
md"""
# Deep Learning with Flux
"""

# ╔═╡ 4d8ba81c-8f18-11eb-066c-71c822b69af2
html"""<style>
main {
	max-width: 1000px;
}
</style>
"""

# ╔═╡ e56c7c1e-8f0f-11eb-3072-9b5e7a023f23
md"""
## 0. Setup
"""

# ╔═╡ 08a8d97a-8f10-11eb-19b4-652600680cec
md"""
### 0.1. Install Packages

```julia
using Pkg;
Pkg.add(["Flux", "BenchmarkTools", "CUDA"]);
```

"""

# ╔═╡ 2a48b00a-8f10-11eb-3a33-ab9704f12b9d
md"""
### 0.2. CUDA setup

**1) Install**
```shell
# Archlinux
yay -S nvidia nvidia-dkms cuda cuda-tools nvtop
```

**2) CUDA.jl**

```julia
using CUDA;
CUDA.versioninfo()
```
"""

# ╔═╡ 44828996-8f10-11eb-0234-9500e43181a6
with_terminal() do
	CUDA.versioninfo()
end

# ╔═╡ 1e5e8e1c-8f13-11eb-03fe-f531a965e07e
md"""
### 0.3. Using packages
"""

# ╔═╡ 71d1d836-8f13-11eb-0b54-83351542c68b
md"""
-----
"""

# ╔═╡ 6fe509c0-8ef1-11eb-03ff-e3cf264a0e2a
md"""
## 1. Automatic Differentiation
"""

# ╔═╡ a252b304-8f13-11eb-0db7-3dffae3a89c8
md"""
Start with next function :

$$f(x) = 3x^2 + 2x + 1$$
"""

# ╔═╡ d14447b6-8ef7-11eb-386e-2dd4b3a80f0e
f(x) = 3x^2 + 2x + 1

# ╔═╡ f2f81ca4-8f13-11eb-35dc-0f26dd656ee4
md"""
$$f(5) = 3 \times 25 + 2 \times 5 + 1 = 86$$
"""

# ╔═╡ d81818ce-8ef7-11eb-1708-013180881b5e
with_terminal() do
	@show f(5)
end

# ╔═╡ c191c3e0-8f13-11eb-3b23-136335e15790
md"""
Let's differentiate it.

$$f'(x) = 6x + 2$$

But we need not write this formula. It can be achieved automatically.
"""

# ╔═╡ db8d56f4-8ef7-11eb-2fd5-4f441213a781
df(x) = gradient(f, x)[1]

# ╔═╡ e09c1252-8ef7-11eb-0a63-a72a7dc99766
with_terminal() do
@show df(5)
end

# ╔═╡ 910ebe52-8f14-11eb-1f87-9fa440029f5e
md"""
And also can calculate higher order derivatives.

$$f''(x) = 6$$
"""

# ╔═╡ f0edbcf0-8ef7-11eb-37e0-bb198720db2c
ddf(x) = gradient(df, x)[1]

# ╔═╡ f7e8e304-8ef7-11eb-3551-cda9be5b256e
with_terminal() do
@show ddf(5)
end

# ╔═╡ e5fdef32-8f14-11eb-3ef1-9b7ee756e7cf
md"""
We can use automatic differentiation with basic syntax - `sum`, `for`, `if` ...

In this case, we use below formula.

$$\sin(x) = \sum_{k=0}^{\infty} \frac{(-1)^k x^{1+2k}}{(1+2k)!}$$
"""

# ╔═╡ 171491ec-8ef8-11eb-142f-eb704f4917e9
mysin(x) = sum((-1)^k * x^(1+2k) / factorial(1+2k) for k in 0:5)

# ╔═╡ 2d679c64-8ef8-11eb-2429-65fb803ff180
mysin(0.5), gradient(mysin, 0.5)[1]

# ╔═╡ 3ad35410-8ef8-11eb-3a61-b5539047f7b5
sin(0.5), cos(0.5)

# ╔═╡ aca73a32-8ef8-11eb-2676-bf6189ae3cf4
md"""
**Matrix derivative**

Now, let consider simple linear expression.

$$\mathcal{L}(W, b, x) = \sum_{i,j} W_{ij}x_j + b_i$$

We can compute derivatives of each paramters.

$$\frac{\partial\mathcal{L}}{\partial W_{ij}} = x_j$$
$$\frac{\partial\mathcal{L}}{\partial b_i} = 1$$
$$\frac{\partial\mathcal{L}}{\partial x_i} = \sum_{k} W_{ki}$$
"""

# ╔═╡ 3db8a9b4-8ef8-11eb-316e-692e1f99bb81
with_terminal() do
	myloss(W, b, x) = sum(W * x .+ b)
	
	W = reshape(1:15, (3, 5))
	b = zeros(3)
	x = reshape(1:5, (5, 1))
	
	@show W
	@show b
	@show x

	dloss = gradient(myloss, W, b, x);
	@show dloss[1]
	@show dloss[2]
	@show dloss[3]
end

# ╔═╡ 2d97b678-8f17-11eb-3c37-1d711a661fa7
md"""
Now, we will run how to handle parameter (not variable)
"""

# ╔═╡ aee0a7c2-8f16-11eb-3d47-996d7f9058cf
with_terminal() do
	W = randn(3, 5)
	b = zeros(3)
	x = rand(5)
	
	y(x) = sum(W * x .+ b) # Only input x
	grads = gradient(() -> y(x), params([W, b]))
	
	@show grads[W]
	@show grads[b]
end

# ╔═╡ 5e5c9d3c-8f17-11eb-26a2-9be61ba2c32f
with_terminal() do
	m = Dense(10, 5); # Network
	x = rand(Float32, 10);
	
	@show params(m)
end

# ╔═╡ Cell order:
# ╟─d2f06a7c-8ef0-11eb-3e7e-0ff96dfe9e53
# ╟─4d8ba81c-8f18-11eb-066c-71c822b69af2
# ╠═a87f27ea-8f12-11eb-34b4-176acc529b2d
# ╟─e56c7c1e-8f0f-11eb-3072-9b5e7a023f23
# ╟─08a8d97a-8f10-11eb-19b4-652600680cec
# ╟─2a48b00a-8f10-11eb-3a33-ab9704f12b9d
# ╟─44828996-8f10-11eb-0234-9500e43181a6
# ╟─1e5e8e1c-8f13-11eb-03fe-f531a965e07e
# ╠═e0d372e4-8ef0-11eb-25d1-0d09d5c1e660
# ╟─71d1d836-8f13-11eb-0b54-83351542c68b
# ╟─6fe509c0-8ef1-11eb-03ff-e3cf264a0e2a
# ╟─a252b304-8f13-11eb-0db7-3dffae3a89c8
# ╠═d14447b6-8ef7-11eb-386e-2dd4b3a80f0e
# ╟─f2f81ca4-8f13-11eb-35dc-0f26dd656ee4
# ╟─d81818ce-8ef7-11eb-1708-013180881b5e
# ╟─c191c3e0-8f13-11eb-3b23-136335e15790
# ╠═db8d56f4-8ef7-11eb-2fd5-4f441213a781
# ╟─e09c1252-8ef7-11eb-0a63-a72a7dc99766
# ╟─910ebe52-8f14-11eb-1f87-9fa440029f5e
# ╠═f0edbcf0-8ef7-11eb-37e0-bb198720db2c
# ╟─f7e8e304-8ef7-11eb-3551-cda9be5b256e
# ╟─e5fdef32-8f14-11eb-3ef1-9b7ee756e7cf
# ╠═171491ec-8ef8-11eb-142f-eb704f4917e9
# ╠═2d679c64-8ef8-11eb-2429-65fb803ff180
# ╠═3ad35410-8ef8-11eb-3a61-b5539047f7b5
# ╟─aca73a32-8ef8-11eb-2676-bf6189ae3cf4
# ╠═3db8a9b4-8ef8-11eb-316e-692e1f99bb81
# ╟─2d97b678-8f17-11eb-3c37-1d711a661fa7
# ╠═e4b783de-8f16-11eb-1225-b3e0eda3e1fa
# ╠═aee0a7c2-8f16-11eb-3d47-996d7f9058cf
# ╠═5e5c9d3c-8f17-11eb-26a2-9be61ba2c32f
