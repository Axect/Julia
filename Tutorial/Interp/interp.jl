using Dierckx
using Winston

# ==============================================================================
# Spline1D - Cubic
# ==============================================================================

X = collect(0.:1.:40.);
Y = sin.(X);

spl = Spline1D(X,Y)

x = collect(0.:.1:40.);
y = spl(x);

# ==============================================================================
# Winston
# ==============================================================================

F = FramedPlot(
    title="Interp",
    xlabel="x",
    ylabel="y"
)

P = Points(X, Y, size=.1)
C = Curve(x,y)

setattr(P, "label", "point")
setattr(C, "label", "interp")
lgnd = Legend(.05, .1, [P, C])

add(F, P, C, lgnd)
savefig(F, "test.svg", (1000,600))
run(`inkscape -z test.svg -e test.png -d 300 --export-background=WHITE`)