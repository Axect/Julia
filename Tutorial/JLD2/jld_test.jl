using FileIO
using JLD2

a = rand(10,10)

save("example.jld2", Dict("mat" => a))

b = load("example.jld2", "mat")

@show b
