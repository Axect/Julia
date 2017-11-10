function Zeta(n, x::Float64)::Float64
    Σ = 0.
    for i =1:n
        Σ+=1/(i^x)
    end
    return Σ
end