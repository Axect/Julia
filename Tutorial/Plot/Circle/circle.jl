using NCDataFrame, DataFrames

function main() 
    θ = 0:0.01:2π
    x = @. cos(θ)
    y = @. sin(θ)
    df = DataFrame(x=x, y=y)
    writenc(df, "data.nc")
end

main()
