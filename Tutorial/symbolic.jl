### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ d0ff446c-f835-11ea-032b-df298c2e4941
using SymPy

# ╔═╡ b79da022-f835-11ea-1ba2-efc6eddc619c
md"# Symbolic math with Julia"

# ╔═╡ d82a68fc-f835-11ea-3855-25209167be79
x = Sym("x")

# ╔═╡ edc48a62-f835-11ea-3d0e-835feb5c32fc
x |> typeof

# ╔═╡ f2e641b6-f835-11ea-2c87-2b113b000bcf
@vars a b c

# ╔═╡ f8ecde4e-f835-11ea-0806-b30e1568c97c
h, y = symbols("h, y", real=true)

# ╔═╡ ffb5733a-f835-11ea-0271-a13f8a65c1a0
x^2 - 2x + 2 |> typeof

# ╔═╡ 047b6c80-f836-11ea-3bcb-5d5b6da5a565
f(x) = exp(-x^2 / 2)

# ╔═╡ 0a5e74a8-f836-11ea-1357-f3208e4272c4
f(x)

# ╔═╡ 0f77372c-f836-11ea-1a30-a933d5eb89a7
subs(f(x), x, 1)

# ╔═╡ 17b89fe8-f836-11ea-040d-4391108578ed
ex = exp(-x^2 / 2)

# ╔═╡ 1dd7e8b8-f836-11ea-25dd-9543df91184c
ex(1)

# ╔═╡ 22470878-f836-11ea-3cb3-efbbd22dc40b
ex(x => 1)

# ╔═╡ 27dc35f8-f836-11ea-179a-aff69b198799
N(ex(1))

# ╔═╡ 2bfa1950-f836-11ea-1778-5de2a35239d9
(2x + 1) + (x + 5)

# ╔═╡ 322ae1ce-f836-11ea-1d7e-131c5c917a02
sin(x)^2 + cos(x)^2 |> simplify

# ╔═╡ 39d94ece-f836-11ea-3497-79433d0038c7
factor(x^2 + 2x + 1)

# ╔═╡ 461bb186-f836-11ea-02f3-9b504e151c3d
expand((x+1)*(x+2)*(x+3))

# ╔═╡ 4b191e88-f836-11ea-0bb1-753a1cbe2a5f
p = expand((x-1)*(x-2)*(x-3)*(x^2 + x + 1))

# ╔═╡ 56a6a4ac-f836-11ea-10ae-675432033af8
factor(p)

# ╔═╡ 589aab28-f836-11ea-1b5d-df8dee294108
roots(p)

# ╔═╡ 65adf8fe-f836-11ea-0ca9-a52b225b996c
[k for(k,v) in roots(p)]

# ╔═╡ 79499972-f836-11ea-0922-a545b3ee172e
q = x^4 - 8x^2 + 8

# ╔═╡ 7f17d7da-f836-11ea-1359-f5131fb24d2b
factor(q)

# ╔═╡ 81a52e08-f836-11ea-0227-510669260e80
roots(q)

# ╔═╡ 864cfbe8-f836-11ea-2f1d-5bffe7b3b84c
real_roots(q)

# ╔═╡ 951b4760-f836-11ea-2505-810e6ab8af26
solve(q)

# ╔═╡ 9aedae76-f836-11ea-16cd-ff3ea16ecc09
as = solve(q)

# ╔═╡ a0748fc2-f836-11ea-3f5d-19db773a075d
N.(as)

# ╔═╡ baea6372-f836-11ea-0b33-0fe37796fb95
solve(exp(x) - 2x^2, x)

# ╔═╡ c2a60206-f836-11ea-347e-9bc77b64e366
nsolve(exp(x) - 2x^2, x, 3)

# ╔═╡ d3473ec2-f836-11ea-2b32-69568fee1cee
sin(x)^2 - (1 // 2)^2 |> solve |> x -> x .* 180 / pi

# ╔═╡ ef7c4632-f836-11ea-11f5-8b4bfff80494
out = solve(x^2 + y^2 - 1, y)

# ╔═╡ f4b1451c-f836-11ea-0a36-8f8d06d7f09f
subs.(out, x, 1//2)

# ╔═╡ Cell order:
# ╟─b79da022-f835-11ea-1ba2-efc6eddc619c
# ╠═d0ff446c-f835-11ea-032b-df298c2e4941
# ╠═d82a68fc-f835-11ea-3855-25209167be79
# ╠═edc48a62-f835-11ea-3d0e-835feb5c32fc
# ╠═f2e641b6-f835-11ea-2c87-2b113b000bcf
# ╠═f8ecde4e-f835-11ea-0806-b30e1568c97c
# ╠═ffb5733a-f835-11ea-0271-a13f8a65c1a0
# ╠═047b6c80-f836-11ea-3bcb-5d5b6da5a565
# ╠═0a5e74a8-f836-11ea-1357-f3208e4272c4
# ╠═0f77372c-f836-11ea-1a30-a933d5eb89a7
# ╠═17b89fe8-f836-11ea-040d-4391108578ed
# ╠═1dd7e8b8-f836-11ea-25dd-9543df91184c
# ╠═22470878-f836-11ea-3cb3-efbbd22dc40b
# ╠═27dc35f8-f836-11ea-179a-aff69b198799
# ╠═2bfa1950-f836-11ea-1778-5de2a35239d9
# ╠═322ae1ce-f836-11ea-1d7e-131c5c917a02
# ╠═39d94ece-f836-11ea-3497-79433d0038c7
# ╠═461bb186-f836-11ea-02f3-9b504e151c3d
# ╠═4b191e88-f836-11ea-0bb1-753a1cbe2a5f
# ╠═56a6a4ac-f836-11ea-10ae-675432033af8
# ╠═589aab28-f836-11ea-1b5d-df8dee294108
# ╠═65adf8fe-f836-11ea-0ca9-a52b225b996c
# ╠═79499972-f836-11ea-0922-a545b3ee172e
# ╠═7f17d7da-f836-11ea-1359-f5131fb24d2b
# ╠═81a52e08-f836-11ea-0227-510669260e80
# ╠═864cfbe8-f836-11ea-2f1d-5bffe7b3b84c
# ╠═951b4760-f836-11ea-2505-810e6ab8af26
# ╠═9aedae76-f836-11ea-16cd-ff3ea16ecc09
# ╠═a0748fc2-f836-11ea-3f5d-19db773a075d
# ╠═baea6372-f836-11ea-0b33-0fe37796fb95
# ╠═c2a60206-f836-11ea-347e-9bc77b64e366
# ╠═d3473ec2-f836-11ea-2b32-69568fee1cee
# ╠═ef7c4632-f836-11ea-11f5-8b4bfff80494
# ╠═f4b1451c-f836-11ea-0a36-8f8d06d7f09f
