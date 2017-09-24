include("src/prob.jl")

A = collect(1.:1.:5.)

println(A)
println("Mean: ", Mean(A))
println("Var: ", Var(A))
println("Std: ", Std(A))
