### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 3f144d86-f833-11ea-1fba-1f3ebcabe962
begin
	#import Pkg
	#Pkg.add.(["Images", "ImageMagick"])
	using Images
end

# ╔═╡ 5ebf9364-f832-11ea-37a3-a1ad683800e8
md"# A concrete first taste at abstraction"

# ╔═╡ 6cfa2994-f832-11ea-046e-5d59e7cf6d3a
element = 1 // 1

# ╔═╡ 73657282-f832-11ea-23a8-d508f1710ed1
fill(element, 3, 4)

# ╔═╡ 7731dee8-f832-11ea-24c5-d3cb3e55837c
element |> typeof

# ╔═╡ 7a67adc2-f832-11ea-002d-3d04adbc49eb
keeptrack = [typeof(1), typeof(1.0), typeof("one"), typeof(1//1)]

# ╔═╡ 82f8abee-f832-11ea-0344-b1b6313ddae2
keeptrack |> typeof

# ╔═╡ Cell order:
# ╟─5ebf9364-f832-11ea-37a3-a1ad683800e8
# ╠═3f144d86-f833-11ea-1fba-1f3ebcabe962
# ╠═6cfa2994-f832-11ea-046e-5d59e7cf6d3a
# ╠═73657282-f832-11ea-23a8-d508f1710ed1
# ╠═7731dee8-f832-11ea-24c5-d3cb3e55837c
# ╠═7a67adc2-f832-11ea-002d-3d04adbc49eb
# ╠═82f8abee-f832-11ea-0344-b1b6313ddae2
