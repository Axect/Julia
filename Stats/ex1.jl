include("src/prob.jl")

A = collect(1.:1.:5.)
B = collect(5.:-1.:1.)

println(A)
println("Mean: ", Mean(A))
println("Var: ", Var(A))
println("Std: ", Std(A))
println("Cov: ", Cov(A,B))