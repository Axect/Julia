using Flux, CUDA, BenchmarkTools
using Flux: gradient

# Array
m1 = rand(100, 100)

# Cuda Array
m2 = cu(rand(100,100))

@btime $m1 * $m1

@btime $m2 * $m2

# Automatic Differentiation
f(x) = 3x^2 + 2x + 1

@show f(5)

df(x) = gradient(f, x)[1]

@show df(5)

ddf(x) = gradient(df, x)[1]

@show ddf(5)

mysin(x) = sum((-1)^k * x^(1+2k) / factorial(1+2k) for k in 0:5)

# ╔═╡ 28ce64aa-8ef8-11eb-0915-7f8a4b57d081
z = 0.5

# ╔═╡ 2d679c64-8ef8-11eb-2429-65fb803ff180
mysin(z), gradient(mysin, z)[1]

# ╔═╡ 3ad35410-8ef8-11eb-3a61-b5539047f7b5
sin(z), cos(z)

# ╔═╡ aca73a32-8ef8-11eb-2676-bf6189ae3cf4
md"""
**Matrix derivative**

$$\mathcal{L}(W, b, x) = \sum_{i,j} W_{ij}x_j + b_i$$
$$\frac{\partial\mathcal{L}}{\partial W_{ij}} = x_j$$
$$\frac{\partial\mathcal{L}}{\partial b_i} = 1$$
$$\frac{\partial\mathcal{L}}{\partial x_i} = \sum_{k} W_{ki}$$
"""

# ╔═╡ 3db8a9b4-8ef8-11eb-316e-692e1f99bb81
begin
	myloss(W, b, x) = sum(W * x .+ b)

	W = reshape(1:15, (3, 5))
	b = zeros(3)
	x = reshape(1:5, (5, 1))

	gradient(myloss, W, b, x)
end

# ╔═╡ b0789c10-8efb-11eb-3e5e-270e412dd346
W, b, x

# ╔═╡ Cell order:
# ╟─d2f06a7c-8ef0-11eb-3e7e-0ff96dfe9e53
# ╠═e0d372e4-8ef0-11eb-25d1-0d09d5c1e660
# ╟─6fe509c0-8ef1-11eb-03ff-e3cf264a0e2a
# ╠═7835f184-8ef1-11eb-3bd2-316d8fdc4910
# ╟─f1750dee-8ef3-11eb-3cd9-6773edad12d4
# ╠═8253d528-8ef1-11eb-1038-6117f6ce39ea
# ╠═84d2492e-8ef1-11eb-0e47-1d8be5308c6c
# ╠═1a49ea82-8ef4-11eb-00c8-c90c7341897c
# ╠═1daac1b0-8ef4-11eb-2dcb-5b6ea8083994
# ╠═361b8338-8ef4-11eb-13cc-7bb27fc35a88
# ╟─a98e63a0-8ef7-11eb-2c46-c7b309cd4194
# ╠═cc77b308-8ef7-11eb-3fa6-2dae95d18807
# ╠═d14447b6-8ef7-11eb-386e-2dd4b3a80f0e
# ╠═d81818ce-8ef7-11eb-1708-013180881b5e
# ╠═db8d56f4-8ef7-11eb-2fd5-4f441213a781
# ╠═e09c1252-8ef7-11eb-0a63-a72a7dc99766
# ╠═f0edbcf0-8ef7-11eb-37e0-bb198720db2c
# ╠═f7e8e304-8ef7-11eb-3551-cda9be5b256e
# ╠═171491ec-8ef8-11eb-142f-eb704f4917e9
# ╠═28ce64aa-8ef8-11eb-0915-7f8a4b57d081
# ╠═2d679c64-8ef8-11eb-2429-65fb803ff180
# ╠═3ad35410-8ef8-11eb-3a61-b5539047f7b5
# ╟─aca73a32-8ef8-11eb-2676-bf6189ae3cf4
# ╠═3db8a9b4-8ef8-11eb-316e-692e1f99bb81
# ╠═b0789c10-8efb-11eb-3e5e-270e412dd346
