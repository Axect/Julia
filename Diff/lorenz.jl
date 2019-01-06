using DifferentialEquations
using Plots

f = @ode_def LorenzExample begin
  dx = σ*(y-x)
  dy = x*(ρ-z) - y
  dz = x*y - β*z
end σ ρ β

u0 = [1.0;0.0;0.0]
tspan = (0.0,100.0)
p = [10.0,28.0,8/3]
prob = ODEProblem(f,u0,tspan,p)

sol = solve(prob)
p = plot(sol, vars=(1,2,3));
png(p, "lorenz.png")
