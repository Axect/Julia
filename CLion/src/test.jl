#=
test:
- Julia version: 
- Author: kavis
- Date: 2019-01-06
=#

using PyPlot

x = collect(1:100);
y = x.^2;

plot(x,y)