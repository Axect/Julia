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

# ╔═╡ 770a03f4-f824-11ea-252a-79e42a581e88
using CSV, PlutoUI

# ╔═╡ 4c7de8d0-f824-11ea-0cec-4f49ef9e2965
begin
	import Pkg
	Pkg.add("CSV");
end

# ╔═╡ 63b2968e-f826-11ea-29ec-c7e10af8f592
html"<p style='text-align:center'> Hi</p>"

# ╔═╡ a31c8828-f828-11ea-0966-a71e55d749e7
@bind s html"<input>"

# ╔═╡ 3abf7c9a-f828-11ea-3ae4-9933aef9aa11
md"_$s_ has a scrabble score of "

# ╔═╡ Cell order:
# ╠═4c7de8d0-f824-11ea-0cec-4f49ef9e2965
# ╠═770a03f4-f824-11ea-252a-79e42a581e88
# ╠═63b2968e-f826-11ea-29ec-c7e10af8f592
# ╠═a31c8828-f828-11ea-0966-a71e55d749e7
# ╠═3abf7c9a-f828-11ea-3ae4-9933aef9aa11
