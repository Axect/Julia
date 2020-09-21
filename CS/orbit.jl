const G= 6.67259e-11
const m = 5.9736e+24
const M = 1.9891e+30
const AU = 1.49597870691e+11
const tstep = 43200
const N = 730 * 10

using Plots

struct Vector
    x::Float64
    y::Float64
    z::Float64
end

function Initialize()
    A = Vector(-9.851920196143998e-01 * AU, 1.316466809434336e-01 * AU, -4.877392224782687e-06 * AU)
    B = Vector(-9.864337701483683e-01 * AU, 1.230799243164879e-01 * AU, -4.374019384763304e-06 * AU)
    return A, B
end

function Plus(A::Vector, B::Vector)::Vector
    C = Vector(0,0,0)
    C.x = A.x + B.x
    C.y = A.y + B.y
    C.z = A.z + B.z
    return C
end

function Add(A::Vector, B::Vector)
    A.x += B.x
    A.y += B.y
    A.z += B.z
end

function Mul(A::Vector, F::Float64)::Vector
    B  = Vector(0,0,0)
    B.x = F * A.x
    B.y = F * A.y
    B.z = F * A.z
    return B
end

function Norm(A::Vector)::Float64
    return sqrt(A.x^2 + A.y^2 + A.z^2)
end

function Running(r::Vector, v::Vector)
    a = Mul(r, float(-G*M/(Norm(r)^3)))
    Add(v, Mul(a, float(tstep)))
    Add(r, Mul(v, float(tstep)))
end



function main()
    i1, i2 = Initialize()
    C = zeros(Float64, N+1)
    C[1] = i1.x; C[2] = i2.x
    v1 = Plus(Mul(i1, 1 / tstep), Mul(i2, -1 / tstep))
    r = i2; v=v1;
    #println(r.x/AU, v.x/AU)
    for i=3:N+1
        Running(r, v)
        C[i] = r.x
    end
    X = 1:1:N+1
    plot(C)
    savefig("CS/Test.png")
end