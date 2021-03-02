using Gadfly, Distributions, DataFrames

Gadfly.push_theme(:dark)

N = 1000
Σ = [2.96626 1.91; 1.91 2.15080]
μ = [0,5]

ct_p = plot(z=(x,y) -> pdf(MvNormal(μ, Σ), [x, y]),
    x=range(-10, stop=10, length=N),
    y=range(-10, stop=10, length=N),
    Geom.contour,
    Guide.title("Bivariate Gaussian"))

draw(SVG("test.svg", 1000px, 600px), ct_p);