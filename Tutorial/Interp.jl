using Dierckx

x = [1, 2, 3, 4]
y = [1, 4, 9, 16]

spl = Spline1D(x, y)
t = 1:0.1:4

using Plots

plot(t, spl(t))