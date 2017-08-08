using Interpolations

x = [1 2 3 4]
y = [1 4 9 16]

itp = interpolate(y, BSpline(Constant()), OnCell())
print(itp[1.2])