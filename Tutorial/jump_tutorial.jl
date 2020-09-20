### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 90764882-fb5f-11ea-34bd-13a4fa5c5794
using JuMP, GLPK

# ╔═╡ 61db939e-fb5f-11ea-3c75-39d1542f8606
md"# JuMP Tutorial

## Install & Import
"

# ╔═╡ e106a21e-fb60-11ea-13ca-210170d90a63
md"## Quick Start"

# ╔═╡ eee58b02-fb60-11ea-0bee-91bfe02df022
model = Model(GLPK.Optimizer)

# ╔═╡ 563a8852-fb61-11ea-1fac-ad2ad7b73497
@variable(model, 0 <= x <= 2)

# ╔═╡ 6065b176-fb61-11ea-0e03-2102d9cc2d7c
@variable(model, 0 <= y <= 30)

# ╔═╡ 67faaf0e-fb61-11ea-321e-dd476f05fc5a
@objective(model, Max, 5x + 3y)

# ╔═╡ 80f18488-fb61-11ea-1901-c77016a5e64b
@constraint(model, con, 1x+5y <= 3)

# ╔═╡ a407f362-fb61-11ea-1607-e1dece7d1c91
optimize!(model)

# ╔═╡ b2ba29ac-fb61-11ea-1c4d-d942b70d8bc5
termination_status(model)

# ╔═╡ b750404e-fb61-11ea-3120-efff93e850c9
primal_status(model)

# ╔═╡ ba77bd12-fb61-11ea-3d78-9faf2d1f3217
dual_status(model)

# ╔═╡ bd0e4852-fb61-11ea-124f-292c8b1b49b9
objective_value(model)

# ╔═╡ c5508f7c-fb61-11ea-20c4-39a41a3ef5cf
value(x)

# ╔═╡ c8e7bbea-fb61-11ea-0fa1-895d65d7474e
value(y)

# ╔═╡ cd2b15b0-fb61-11ea-15c8-a5e0e041ac4f
dual(con)

# ╔═╡ d51b5716-fb61-11ea-0d39-e94d519d59dc
x_upper = UpperBoundRef(x)

# ╔═╡ dbfbc5aa-fb61-11ea-2db2-159b46483afa
x_upper |> dual

# ╔═╡ e0870684-fb61-11ea-0fbb-b7ea12607780
y_lower = LowerBoundRef(y)

# ╔═╡ e52fb9a6-fb61-11ea-0d3f-d112e007283a
dual(y_lower)

# ╔═╡ Cell order:
# ╟─61db939e-fb5f-11ea-3c75-39d1542f8606
# ╠═90764882-fb5f-11ea-34bd-13a4fa5c5794
# ╠═e106a21e-fb60-11ea-13ca-210170d90a63
# ╠═eee58b02-fb60-11ea-0bee-91bfe02df022
# ╠═563a8852-fb61-11ea-1fac-ad2ad7b73497
# ╠═6065b176-fb61-11ea-0e03-2102d9cc2d7c
# ╠═67faaf0e-fb61-11ea-321e-dd476f05fc5a
# ╠═80f18488-fb61-11ea-1901-c77016a5e64b
# ╠═a407f362-fb61-11ea-1607-e1dece7d1c91
# ╠═b2ba29ac-fb61-11ea-1c4d-d942b70d8bc5
# ╠═b750404e-fb61-11ea-3120-efff93e850c9
# ╠═ba77bd12-fb61-11ea-3d78-9faf2d1f3217
# ╠═bd0e4852-fb61-11ea-124f-292c8b1b49b9
# ╠═c5508f7c-fb61-11ea-20c4-39a41a3ef5cf
# ╠═c8e7bbea-fb61-11ea-0fa1-895d65d7474e
# ╠═cd2b15b0-fb61-11ea-15c8-a5e0e041ac4f
# ╠═d51b5716-fb61-11ea-0d39-e94d519d59dc
# ╠═dbfbc5aa-fb61-11ea-2db2-159b46483afa
# ╠═e0870684-fb61-11ea-0fbb-b7ea12607780
# ╠═e52fb9a6-fb61-11ea-0d3f-d112e007283a
