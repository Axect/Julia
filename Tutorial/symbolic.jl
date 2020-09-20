### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ d0ff446c-f835-11ea-032b-df298c2e4941
using SymPy

# ╔═╡ 80be4c24-f839-11ea-2e6c-c3dcbfde29b2
using Plots

# ╔═╡ b79da022-f835-11ea-1ba2-efc6eddc619c
md"# Symbolic math with Julia"

# ╔═╡ d82a68fc-f835-11ea-3855-25209167be79
x = Sym("x")

# ╔═╡ edc48a62-f835-11ea-3d0e-835feb5c32fc
x |> typeof

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

# ╔═╡ a460d68e-f838-11ea-06c9-b9492e452df4
begin
	eq1 = x + y - 1
	eq2 = x - y - (-1)
	solve([eq1,eq2], [x,y])
end

# ╔═╡ c6f6d1a8-f838-11ea-2586-f1710cb0f8b8
expand((x-1)*(x-2)*(x-3)*(x-4)*(x-5))

# ╔═╡ e08cdc0c-f838-11ea-32b5-8556ae917870
((1x + 2)x + 3)x + 4 |> expand

# ╔═╡ fab8fb1a-f838-11ea-3c38-d3f2a0de566f
x^3 - 6x^2 + 11x - 6 |> real_roots |> x -> N.(x) |> maximum

# ╔═╡ 404c017c-f839-11ea-34f9-3985a0d249db
solve(x^2 - (3^2 + 4^2))

# ╔═╡ 4fa69198-f839-11ea-116c-9711a62d5bcf
x^4 - 10x^3 + 32x^2 - 38x + 15 |> solve |> x -> N.(x) |> maximum

# ╔═╡ 62924a8e-f839-11ea-2497-f982a6c3e12d
solve(exp(x) - x^4) |> x -> N.(x) |> minimum

# ╔═╡ 1ab0bdb0-f83a-11ea-23c0-6d589250817e
md"## Using Plots"

# ╔═╡ bcac4eca-f839-11ea-2ee3-7fe6b2cc834d
new_ex = x^2 - 2x + 4

# ╔═╡ c707525c-f839-11ea-3657-2dfa732ae299
plot(new_ex, -1, 3)

# ╔═╡ db408fb8-f839-11ea-1487-b76ba0fd661b
begin
	g(x) = sqrt(x);
	c = 2;
	gp = diff(g(x));
	m = gp(x => c);
	plot(g(x), 1, 3)
	plot!(g(c) + m * (x - c))
end

# ╔═╡ 0b62b4dc-f83a-11ea-2517-0d198e042be4
plot(x^4-3x^3+3x^2-3x+2, -1, 3)

# ╔═╡ 2337a180-f83a-11ea-1a35-9b6eb2d080c5
md"## Limits"

# ╔═╡ 2b26b976-f83a-11ea-0aaf-2f09a99eb970
limit(sin(x) / x, x, 0)

# ╔═╡ 333c3780-f83a-11ea-0762-53c4eb5e7ee4
limit((1- cos(x)) / x^2, x, 0)

# ╔═╡ 3b39e068-f83a-11ea-245d-b9ffceb43906
λ = symbols("lambda")

# ╔═╡ 421d6c42-f83a-11ea-36a1-abc37410cc90
limit((1 - λ * x)^(1/x), x, 0)

# ╔═╡ 5973c72e-f83a-11ea-1b7b-59d9b1bb3a75
limit(sin(x) / x, x, oo)

# ╔═╡ 61fa6ccc-f83a-11ea-0050-7db683264c9d
begin
	new_f(x) = x^10
	limit((new_f(x + h)- new_f(x)) / h, h, 0)
end

# ╔═╡ 80413880-f83a-11ea-28e5-f58818e59e0c
begin
	new_g(x) = sin(x)
	limit((new_f(new_g(x+h)) - new_f(new_g(x))) / h, h, 0) |> subs(x, 1)
end

# ╔═╡ a8b6df9c-f83a-11ea-3393-079011346e82
limit((3 - sqrt(x + 5)) / (x - 4), x, 4.0) |> N

# ╔═╡ d9a58068-f83a-11ea-0017-1b0096f3f396
limit((x^(1/4) - 1) / (x^(1/3) - 1), x, 1)

# ╔═╡ f6f35d68-f83a-11ea-1cc7-11beb5eede05
begin
	@vars k positive=true
	top = (2k^3*x - x^4)^(1//2) - k*(k^2*x)^(1//3)
	bottom = k - (k*x^3)^(1//4)
	ex2 = top / bottom
	limit(ex2, x, k)
end

# ╔═╡ Cell order:
# ╟─b79da022-f835-11ea-1ba2-efc6eddc619c
# ╠═d0ff446c-f835-11ea-032b-df298c2e4941
# ╠═d82a68fc-f835-11ea-3855-25209167be79
# ╠═edc48a62-f835-11ea-3d0e-835feb5c32fc
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
# ╠═a460d68e-f838-11ea-06c9-b9492e452df4
# ╠═c6f6d1a8-f838-11ea-2586-f1710cb0f8b8
# ╠═e08cdc0c-f838-11ea-32b5-8556ae917870
# ╠═fab8fb1a-f838-11ea-3c38-d3f2a0de566f
# ╠═404c017c-f839-11ea-34f9-3985a0d249db
# ╠═4fa69198-f839-11ea-116c-9711a62d5bcf
# ╠═62924a8e-f839-11ea-2497-f982a6c3e12d
# ╟─1ab0bdb0-f83a-11ea-23c0-6d589250817e
# ╠═80be4c24-f839-11ea-2e6c-c3dcbfde29b2
# ╠═bcac4eca-f839-11ea-2ee3-7fe6b2cc834d
# ╠═c707525c-f839-11ea-3657-2dfa732ae299
# ╠═db408fb8-f839-11ea-1487-b76ba0fd661b
# ╠═0b62b4dc-f83a-11ea-2517-0d198e042be4
# ╟─2337a180-f83a-11ea-1a35-9b6eb2d080c5
# ╠═2b26b976-f83a-11ea-0aaf-2f09a99eb970
# ╠═333c3780-f83a-11ea-0762-53c4eb5e7ee4
# ╠═3b39e068-f83a-11ea-245d-b9ffceb43906
# ╠═421d6c42-f83a-11ea-36a1-abc37410cc90
# ╠═5973c72e-f83a-11ea-1b7b-59d9b1bb3a75
# ╠═61fa6ccc-f83a-11ea-0050-7db683264c9d
# ╠═80413880-f83a-11ea-28e5-f58818e59e0c
# ╠═a8b6df9c-f83a-11ea-3393-079011346e82
# ╠═d9a58068-f83a-11ea-0017-1b0096f3f396
# ╠═f6f35d68-f83a-11ea-1cc7-11beb5eede05
