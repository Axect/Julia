### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 1a6c7f9e-f81c-11ea-1112-b19623171f1f
md"# Julia & Pluto Install
## Remove Julia 1.5.1

```sh
# Arch linux
yay -Rc julia

# Remove julia registry
rm -rf ~/.julia
```

## Install Julia LTS (Long Term Support)

1. Go to [Julia Website](https://julialang.org/)

2. Install proper version of julia LTS

3. Extract to proper directory (e.g. \$HOME/zbin)

4. Make symbolic link to `/usr/bin` or `/usr/local/bin`
    
    ```
    sudo ln -s $HOME/zbin/julia-1.0.5/bin/julia /usr/bin/julia
    ```

## Install Pluto & useful tools
"

# ╔═╡ 48fb2706-f822-11ea-204a-87500ffa026e
begin
	import Pkg
	Pkg.update()
	Pkg.add("DataFrames")
	Pkg.add("Pluto")
	Pkg.add("Flux")
	Pkg.add("IJulia")
	Pkg.add("PlutoUI")
	Pkg.add("DifferentialEquations")
	Pkg.add("SymPy")
	Pkg.add("Plots")
	Pkg.add("Luxor")
	
	# If you have any problem with installation, try re-install after remove `Plots`
end

# ╔═╡ Cell order:
# ╟─1a6c7f9e-f81c-11ea-1112-b19623171f1f
# ╠═48fb2706-f822-11ea-204a-87500ffa026e
