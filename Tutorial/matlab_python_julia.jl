### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ ca419c2a-fb5b-11ea-3567-2357d7c331ce
using LinearAlgebra

# ╔═╡ 1bbc9454-fb5c-11ea-1bf8-796581a8014e
using SparseArrays

# ╔═╡ 8beb919c-fb59-11ea-371b-493df7576786
md"# MATLAB-Python-Julia Cheat Sheet"

# ╔═╡ d0732960-fb59-11ea-1c2f-15935a694865
md"## Creating Vectors"

# ╔═╡ dcce031c-fb59-11ea-3d4c-6dc0b0a13df2
A = [1 2 3]

# ╔═╡ fa0195e6-fb59-11ea-0873-9141bcf3e607
B = [1 2 3]'

# ╔═╡ fed28dbe-fb59-11ea-3c27-274151d3005b
C = [1; 2; 3]

# ╔═╡ 8182788c-fb5a-11ea-1c90-5332d5b09405
Base.summarysize(A)

# ╔═╡ bfb8b030-fb5a-11ea-1fbe-9757f0e65eb7
Base.summarysize(B)

# ╔═╡ c34220ce-fb5a-11ea-0312-fd470641afe8
Base.summarysize(C)

# ╔═╡ 04682e64-fb5a-11ea-30ea-53b2cc327974
r1 = 1:0.1:10

# ╔═╡ 27b8aa56-fb5a-11ea-3e9f-6d6b38343a0b
r2 = range(1, step=0.1, length = 100)

# ╔═╡ 4da2e56a-fb5a-11ea-0033-c93bfdeaa9fd
md"## Creating Matrices"

# ╔═╡ bd0d3424-fb5b-11ea-0772-efbf87b14fad
A2 = [1 2;3 4]

# ╔═╡ c2b5427a-fb5b-11ea-1ada-e518001250b8
B2 = zeros(2, 2)

# ╔═╡ c66e9e8e-fb5b-11ea-047f-5f091f2f2048
C2 = ones(2, 2)

# ╔═╡ ee17b9e0-fb5b-11ea-01bd-4979564a9426
I

# ╔═╡ f1be0124-fb5b-11ea-3017-27622d20fc08
A2 * I

# ╔═╡ f40fe4f6-fb5b-11ea-20a8-abf9038686e4
B2 * I

# ╔═╡ f91dd6ae-fb5b-11ea-05e9-01a858f3fcaa
Diagonal([1,2,3])

# ╔═╡ 1e43b232-fb5c-11ea-3d3e-d345bed123e0
begin
	D2 = spzeros(2,2)
	D2[1,2] = 4
	D2[2,2] = 1
end

# ╔═╡ 2fed5134-fb5c-11ea-1193-3b265db462f9
D2

# ╔═╡ 42f73158-fb5c-11ea-0c1c-4fd1e5ab9259
Tridiagonal([1,2,3],[4,5,6,7],[8,9,10])

# ╔═╡ 666d2c52-fb5c-11ea-3f48-917d41d9c98a
md"## Manipulating Vectors and Matrices"

# ╔═╡ 6e6f7c8e-fb5c-11ea-32a0-eb4157566fa4
A3 = [A A]

# ╔═╡ 948db57a-fb5c-11ea-29d9-f56fd803a198
B3 = [B B]

# ╔═╡ a097fca4-fb5c-11ea-029c-0b32e7b4b34d
C3 = [C C]

# ╔═╡ a400c484-fb5c-11ea-3cf1-57052d847829
A4 = [A; A]

# ╔═╡ a9864a64-fb5c-11ea-3ee2-2f1d51916590
B4 = [B; B]

# ╔═╡ abdcd6ac-fb5c-11ea-34d4-3ff2eda40dc9
C4 = [C; C]

# ╔═╡ b29fd228-fb5c-11ea-0051-8d515ff89748
reshape(1:10, 5, 2)

# ╔═╡ bb805e80-fb5c-11ea-3dcc-593ded9161c7
A4[:] # Column direction vector

# ╔═╡ c7319f3c-fb5c-11ea-182c-ed9db48a41b4
reverse(reshape(1:10, 5, 2), dims=2)

# ╔═╡ d782b57e-fb5c-11ea-29cd-adbfbc189dff
reverse(reshape(1:10, 5, 2), dims=1)

# ╔═╡ da7b3bde-fb5c-11ea-0682-d512bfef4117
A5 = reshape(1:6, 2, 3)

# ╔═╡ f47f8134-fb5c-11ea-37fa-2189e3591c8a
repeat(A5, 2, 3)

# ╔═╡ fe7f26a0-fb5c-11ea-2b95-ad4d78aa7900
x = rand(3,3)

# ╔═╡ 0e74c6c6-fb5d-11ea-2a45-897914b49860
# Preallocating
y = similar(x)

# ╔═╡ 10ed0b32-fb5d-11ea-2486-41eda648b24f
y2 = similar(x, 2, 2)

# ╔═╡ 376ca3fa-fb5d-11ea-1f85-8b7bbe060aeb
# Broadcast
begin
	f(x) = x^2
	dom = 1:10
	f.(dom)
end

# ╔═╡ 6208299a-fb5d-11ea-2028-6b58119d512a
A5

# ╔═╡ 6abc5d6a-fb5e-11ea-24a5-b18db9b5c867
cumsum(A5, dims=2)

# ╔═╡ 729bed9a-fb5e-11ea-2caa-a7554f7ad24f
cumsum(A5, dims=1)

# ╔═╡ 8aabe700-fb5e-11ea-1d7b-1fc3221c1309
sum(A5)

# ╔═╡ 914d6278-fb5e-11ea-0c11-77fe530221d9
sum(A5, dims=1)

# ╔═╡ 93458fba-fb5e-11ea-1fec-7bee78e406ce
sum(A5, dims=2)

# ╔═╡ Cell order:
# ╟─8beb919c-fb59-11ea-371b-493df7576786
# ╠═d0732960-fb59-11ea-1c2f-15935a694865
# ╠═dcce031c-fb59-11ea-3d4c-6dc0b0a13df2
# ╠═fa0195e6-fb59-11ea-0873-9141bcf3e607
# ╠═fed28dbe-fb59-11ea-3c27-274151d3005b
# ╠═8182788c-fb5a-11ea-1c90-5332d5b09405
# ╠═bfb8b030-fb5a-11ea-1fbe-9757f0e65eb7
# ╠═c34220ce-fb5a-11ea-0312-fd470641afe8
# ╠═04682e64-fb5a-11ea-30ea-53b2cc327974
# ╠═27b8aa56-fb5a-11ea-3e9f-6d6b38343a0b
# ╠═4da2e56a-fb5a-11ea-0033-c93bfdeaa9fd
# ╠═bd0d3424-fb5b-11ea-0772-efbf87b14fad
# ╠═c2b5427a-fb5b-11ea-1ada-e518001250b8
# ╠═c66e9e8e-fb5b-11ea-047f-5f091f2f2048
# ╠═ca419c2a-fb5b-11ea-3567-2357d7c331ce
# ╠═ee17b9e0-fb5b-11ea-01bd-4979564a9426
# ╠═f1be0124-fb5b-11ea-3017-27622d20fc08
# ╠═f40fe4f6-fb5b-11ea-20a8-abf9038686e4
# ╠═f91dd6ae-fb5b-11ea-05e9-01a858f3fcaa
# ╠═1bbc9454-fb5c-11ea-1bf8-796581a8014e
# ╠═1e43b232-fb5c-11ea-3d3e-d345bed123e0
# ╠═2fed5134-fb5c-11ea-1193-3b265db462f9
# ╠═42f73158-fb5c-11ea-0c1c-4fd1e5ab9259
# ╟─666d2c52-fb5c-11ea-3f48-917d41d9c98a
# ╠═6e6f7c8e-fb5c-11ea-32a0-eb4157566fa4
# ╠═948db57a-fb5c-11ea-29d9-f56fd803a198
# ╠═a097fca4-fb5c-11ea-029c-0b32e7b4b34d
# ╠═a400c484-fb5c-11ea-3cf1-57052d847829
# ╠═a9864a64-fb5c-11ea-3ee2-2f1d51916590
# ╠═abdcd6ac-fb5c-11ea-34d4-3ff2eda40dc9
# ╠═b29fd228-fb5c-11ea-0051-8d515ff89748
# ╠═bb805e80-fb5c-11ea-3dcc-593ded9161c7
# ╠═c7319f3c-fb5c-11ea-182c-ed9db48a41b4
# ╠═d782b57e-fb5c-11ea-29cd-adbfbc189dff
# ╠═da7b3bde-fb5c-11ea-0682-d512bfef4117
# ╠═f47f8134-fb5c-11ea-37fa-2189e3591c8a
# ╠═fe7f26a0-fb5c-11ea-2b95-ad4d78aa7900
# ╠═0e74c6c6-fb5d-11ea-2a45-897914b49860
# ╠═10ed0b32-fb5d-11ea-2486-41eda648b24f
# ╠═376ca3fa-fb5d-11ea-1f85-8b7bbe060aeb
# ╠═6208299a-fb5d-11ea-2028-6b58119d512a
# ╠═6abc5d6a-fb5e-11ea-24a5-b18db9b5c867
# ╠═729bed9a-fb5e-11ea-2caa-a7554f7ad24f
# ╠═8aabe700-fb5e-11ea-1d7b-1fc3221c1309
# ╠═914d6278-fb5e-11ea-0c11-77fe530221d9
# ╠═93458fba-fb5e-11ea-1fec-7bee78e406ce
