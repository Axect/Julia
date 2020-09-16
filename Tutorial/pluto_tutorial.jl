### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 0d5600c0-f7fc-11ea-3cb3-7171d4061cc7
using Plots

# ╔═╡ 6744c76e-f802-11ea-00b6-45a4308b8f7f
using PlutoUI

# ╔═╡ 74216fd8-f7fc-11ea-18f8-f1d994064b28
md"# Pluto Tutorial
## Plotting
"

# ╔═╡ 56817be8-f802-11ea-12ba-81117accefaf
#import Pkg; Pkg.add("PlutoUI")

# ╔═╡ d02c14cc-f801-11ea-29fc-93693c344d3e
x = 1:10;

# ╔═╡ fea31f52-f802-11ea-295f-0fb28b62c94b
md"Slider binding!"

# ╔═╡ 741f4aea-f802-11ea-39f4-0785787e392d
@bind s Slider(1:10)

# ╔═╡ 797d77dc-f802-11ea-1241-e3a14953b4b4
y = rand(10, s);

# ╔═╡ 2532ffa2-f803-11ea-39f1-79481b9fabad
@bind l Slider(1:5)

# ╔═╡ d95e8f84-f801-11ea-10a2-ab1c9cab1490
plot(x, y, lw=l, layout=(s,1))

# ╔═╡ Cell order:
# ╟─74216fd8-f7fc-11ea-18f8-f1d994064b28
# ╠═0d5600c0-f7fc-11ea-3cb3-7171d4061cc7
# ╠═56817be8-f802-11ea-12ba-81117accefaf
# ╠═6744c76e-f802-11ea-00b6-45a4308b8f7f
# ╠═d95e8f84-f801-11ea-10a2-ab1c9cab1490
# ╠═d02c14cc-f801-11ea-29fc-93693c344d3e
# ╟─fea31f52-f802-11ea-295f-0fb28b62c94b
# ╠═741f4aea-f802-11ea-39f4-0785787e392d
# ╠═797d77dc-f802-11ea-1241-e3a14953b4b4
# ╠═2532ffa2-f803-11ea-39f1-79481b9fabad
