using PyPlot;

X = -1:0.0001:1
Y = sqrt.(1.-X.^2)
Z = -sqrt.(1 .- X.^2)

plot(X,Y)
plot(X,Z)
savefig("Circ.png")