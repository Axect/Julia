function Mean(A::Array{Float64})::Float64
    s = 0
    for x in A
        s += x
    end
    return s
end

function Var(A::Array{Float64})::Float64
    # Sample Mean
    m = Mean(A)
    s = 0
    for x in A
        s += (x - m)^2
    end
    s = s / (length(A)-1)
    return s
end

function Std(A::Array{Float64})::Float64
    return sqrt(Var(A))
end