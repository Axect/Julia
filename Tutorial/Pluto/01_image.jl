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

# ╔═╡ 2ec5b5a4-f82c-11ea-2961-a33abe9f9ebc
begin
	using Images
	philip = load("philip.jpg")
end

# ╔═╡ 0af40020-f82e-11ea-1764-99e034927d4b
using PlutoUI

# ╔═╡ 5bcf90c0-f82b-11ea-02ae-75c1c1c7fdb1
md"# Module I: Images
* Let's use the `Images.jl` package to load an image and see what happens
"

# ╔═╡ 658d74da-f82b-11ea-216f-9da01ea84f2d
url = "https://i.imgur.com/VGPeJ6s.jpg"

# ╔═╡ 234e63c4-f82c-11ea-2983-e386ec9eb309
download(url, "philip.jpg")

# ╔═╡ c7ef0bee-f82d-11ea-35bf-7975f11ba405
philip

# ╔═╡ cffd0106-f82d-11ea-2870-210b986cdffa
philip |> typeof

# ╔═╡ fd1d56b0-f82d-11ea-374e-11f7a27f4de4
@bind red Slider(0:0.1:1)

# ╔═╡ 15f12f20-f82e-11ea-000c-9323b34fa918
@bind green Slider(0:0.1:1)

# ╔═╡ 1ae50d12-f82e-11ea-2784-3df30ba8ed5a
@bind blue Slider(0:0.1:1)

# ╔═╡ ecfab672-f82d-11ea-0182-5d194ef5a023
RGB(red, green, blue)

# ╔═╡ 898eae4e-f82e-11ea-389e-c755148cc15f
 philip |> size

# ╔═╡ b169b6f2-f82e-11ea-32f2-ddb112b1068c
@bind row Slider(1:3675)

# ╔═╡ bc27d1fa-f82e-11ea-3df6-fb371e2012b3
@bind col Slider(1:2988)

# ╔═╡ 94717436-f82e-11ea-1cbd-cf9d25f907cd
philip[row, col]

# ╔═╡ 0a92276e-f82f-11ea-3790-0787ea3212b3
eye = philip[2000:3000, 1000:2000]

# ╔═╡ 49636bf6-f82f-11ea-2ed3-c5472f99027d
[eye reverse(eye, dims=2); reverse(eye, dims=1) reverse(reverse(eye, dims=1), dims=2)]

# ╔═╡ e594897c-f82f-11ea-0f27-192435d32baf
new_phil = copy(eye)

# ╔═╡ 1f7d3532-f830-11ea-1ae6-f3ce0e8c6f65
new_phil[1:100, 1:300] .= RGB(1,0,0)

# ╔═╡ 4cc58c6a-f830-11ea-0cb0-e306455a619c
new_phil

# ╔═╡ 6eb30154-f830-11ea-2e8f-5fd14517d5f8
function redify(c)
	return RGB(c.r, 0, 0)
end

# ╔═╡ 7da1c02e-f830-11ea-0d06-edce5e65a92c
begin
	color = RGB(0.8, 0.5, 0.2)
	
	[color, redify(color)]
end

# ╔═╡ edb9c0aa-f830-11ea-0123-a52c47fe41ab
redify.(philip)

# ╔═╡ 24c5eed4-f831-11ea-1b70-f31427c40969
begin
	poor_phil = decimate(new_phil, 2)
	size(poor_phil)
	poor_phil
end

# ╔═╡ a72f2b10-f831-11ea-37f4-bb75b95fb168
conv(poor_phil, blur(2))

# ╔═╡ Cell order:
# ╠═5bcf90c0-f82b-11ea-02ae-75c1c1c7fdb1
# ╠═658d74da-f82b-11ea-216f-9da01ea84f2d
# ╠═234e63c4-f82c-11ea-2983-e386ec9eb309
# ╠═2ec5b5a4-f82c-11ea-2961-a33abe9f9ebc
# ╠═c7ef0bee-f82d-11ea-35bf-7975f11ba405
# ╠═cffd0106-f82d-11ea-2870-210b986cdffa
# ╠═0af40020-f82e-11ea-1764-99e034927d4b
# ╠═fd1d56b0-f82d-11ea-374e-11f7a27f4de4
# ╠═15f12f20-f82e-11ea-000c-9323b34fa918
# ╠═1ae50d12-f82e-11ea-2784-3df30ba8ed5a
# ╠═ecfab672-f82d-11ea-0182-5d194ef5a023
# ╠═898eae4e-f82e-11ea-389e-c755148cc15f
# ╠═94717436-f82e-11ea-1cbd-cf9d25f907cd
# ╠═b169b6f2-f82e-11ea-32f2-ddb112b1068c
# ╠═bc27d1fa-f82e-11ea-3df6-fb371e2012b3
# ╠═0a92276e-f82f-11ea-3790-0787ea3212b3
# ╠═49636bf6-f82f-11ea-2ed3-c5472f99027d
# ╠═e594897c-f82f-11ea-0f27-192435d32baf
# ╠═1f7d3532-f830-11ea-1ae6-f3ce0e8c6f65
# ╠═4cc58c6a-f830-11ea-0cb0-e306455a619c
# ╠═6eb30154-f830-11ea-2e8f-5fd14517d5f8
# ╠═7da1c02e-f830-11ea-0d06-edce5e65a92c
# ╠═edb9c0aa-f830-11ea-0123-a52c47fe41ab
# ╠═24c5eed4-f831-11ea-1b70-f31427c40969
# ╠═a72f2b10-f831-11ea-37f4-bb75b95fb168
