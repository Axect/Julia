using BenchmarkTools, DataFrames, CSV, LoopVectorization

function map_test(x::S) where {T <: Number, S <: AbstractVector{T}}
    map(t -> sqrt(t), x)
end

function vmap_test(x::S) where {T <: Number, S <: AbstractVector{T}}
    vmap(t -> sqrt(t), x)
end

function vmapnt_test(x::S) where {T <: Number, S <: AbstractVector{T}}
    vmapnt(t -> sqrt(t), x)
end

function vmap!_test(x::S) where {T <: Number, S <: AbstractVector{T}}
    z = similar(x)
    vmap!(t -> sqrt(t), z, x)
end

function vmapnt!_test(x::S) where {T <: Number, S <: AbstractVector{T}}
    z = similar(x)
    vmapnt!(t -> sqrt(t), z, x)
end

function avx_test(x::S) where {T <: Number, S <: AbstractVector{T}}
    z = similar(x)
    @avx for i in eachindex(x)
        z[i] = sqrt(x[i])
    end
    return z
end

function vectorize_test(x::S) where {T <: Number, S <: AbstractVector{T}}
    sqrt.(x)
end

df1 = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])
df2 = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])
df3 = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])
df4 = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])
df5 = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])
df6 = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])
df7 = DataFrame(min=Float64[], mean=Float64[], max=Float64[], param=Int64[])

for p in 4:8
    x = Vector{Float64}(undef, 10^p)
    b1 = @benchmark map_test($x)
    b2 = @benchmark vmap_test($x)
    b3 = @benchmark vmapnt_test($x)
    b4 = @benchmark vmap!_test($x)
    b5 = @benchmark vmapnt!_test($x)
    b6 = @benchmark avx_test($x)
    b7 = @benchmark vectorize_test($x)
    push!(
        df1, 
        Dict(
            :min    => minimum(b1).time,
            :mean   => mean(b1).time,
            :max    => maximum(b1).time,
            :param  => 10^p
        )
    )
    push!(
        df2, 
        Dict(
            :min    => minimum(b2).time,
            :mean   => mean(b2).time,
            :max    => maximum(b2).time,
            :param  => 10^p
        )
    )
    push!(
        df3, 
        Dict(
            :min    => minimum(b3).time,
            :mean   => mean(b3).time,
            :max    => maximum(b3).time,
            :param  => 10^p
        )
    )
    push!(
        df4, 
        Dict(
            :min    => minimum(b4).time,
            :mean   => mean(b4).time,
            :max    => maximum(b4).time,
            :param  => 10^p
        )
    )
    push!(
        df5, 
        Dict(
            :min    => minimum(b5).time,
            :mean   => mean(b5).time,
            :max    => maximum(b5).time,
            :param  => 10^p
        )
    )
    push!(
        df6, 
        Dict(
            :min    => minimum(b6).time,
            :mean   => mean(b6).time,
            :max    => maximum(b6).time,
            :param  => 10^p
        )
    )
    push!(
        df7, 
        Dict(
            :min    => minimum(b7).time,
            :mean   => mean(b7).time,
            :max    => maximum(b7).time,
            :param  => 10^p
        )
    )
end

df1[:, :min] ./= 10^9
df1[:, :mean] ./= 10^9
df1[:, :max] ./= 10^9
df2[:, :min] ./= 10^9
df2[:, :mean] ./= 10^9
df2[:, :max] ./= 10^9
df3[:, :min] ./= 10^9
df3[:, :mean] ./= 10^9
df3[:, :max] ./= 10^9
df4[:, :min] ./= 10^9
df4[:, :mean] ./= 10^9
df4[:, :max] ./= 10^9
df5[:, :min] ./= 10^9
df5[:, :mean] ./= 10^9
df5[:, :max] ./= 10^9
df6[:, :min] ./= 10^9
df6[:, :mean] ./= 10^9
df6[:, :max] ./= 10^9
df7[:, :min] ./= 10^9
df7[:, :mean] ./= 10^9
df7[:, :max] ./= 10^9

CSV.write("bench/bench_julia_map.csv", df1)
CSV.write("bench/bench_julia_vmap.csv", df2)
CSV.write("bench/bench_julia_vmapnt.csv", df3)
CSV.write("bench/bench_julia_vmap2.csv", df4)
CSV.write("bench/bench_julia_vmapnt2.csv", df5)
CSV.write("bench/bench_julia_avx.csv", df6)
CSV.write("bench/bench_julia_vectorize.csv", df7)
