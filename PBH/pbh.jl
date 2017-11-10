using Gadfly, DataFrames

const Mp = 1.221 * 1E+19
const MpR = 2.4 * 1E+18
const MW = 80.385
const MZ = 91.1876
const MH = 125.09
const alphasMZ = 0.1182
const h = 1E-04
const N = 44

# Declare RGE Type
mutable struct RGE
    t::Float64
    lH::Float64
    yt::Float64
    g1::Float64
    g2::Float64
    g3::Float64
    phi::Float64
    G::Float64
end

function Copy(R::RGE)::RGE
    # Return New RGE Variables -> Protect Value for running
    S = RGE(0.,0.,0.,0.,0.,0.,0.,0.)
    S.t = R.t
    S.lH = R.lH
    S.yt = R.yt
    S.g3 = R.g3
    S.g2 = R.g2
    S.g1 = R.g1
    S.phi = R.phi
    S.G = R.G
    return S
end

function init(mt::Float64)::RGE
    R = RGE(0.,0.,0.,0.,0.,0.,0.,0.)
    R.t = 0.
    R.lH = 0.12604 + 0.00206(MH - 125.15) - 0.00004(mt - 173.34)
    R.yt = (0.93690 + 0.00556(mt - 173.34) - 0.00003(MH - 125.15) - 0.00042(alphasMZ - 0.1184) / 0.0007)
    R.g3 = 1.1666 + 0.00314(alphasMZ - 0.1184) / 0.007 - 0.00046(mt - 173.34)
    R.g2 = 0.64779 + 0.00004(mt - 173.34) + 0.00011(MW - 80.384) / 0.014
    R.g1 = 0.35830 + 0.00011(mt - 173.34) - 0.00020(MW - 80.384) / 0.014
    R.phi = sqrt(2.)/R.yt * mt * exp(R.t)
    R.G = 1.
    return R
end

function MakeBeta(γ)
    return function f(f1::Float64, f2::Float64)::Float64
        tempval = 1/(16π^2)f1 + (1/(16π^2)^2)f2
        return tempval/(1 + γ)
    end
end

function Running(R::RGE, mt::Float64, xi::Float64)
    hg = (sqrt(2)/R.yt)*mt*exp(R.t)
    sh = (1+xi*hg^2/MpR^2)/(1+(1+6xi)*xi*hg^2/MpR^2)

    # 1-loop Beta Function
    β1_g1 = (81 + sh)/12 * R.g1^3
    β1_g2 = -(39 - sh)/12 * R.g2^3
    β1_g3 = -7R.g3^3
    β1_lH = 6.*(1+3sh^2)*R.lH^2 + 12R.lH*R.yt^2 - 6R.yt^4 - 3R.lH*(3R.g2^2+R.g1^2) + 3/8*(2R.g2^4+(R.g1^2+R.g2^2)^2)
    β1_yt = R.yt*((23/6 + 2/3 * sh)*R.yt^2 - (8R.g3^2+9/4 * R.g2^2+17/12 * R.g1^2))
    # β1_xi = (6(1+sh)*R.lH + 6*R.yt^2-3/2*(R.g1^2+3*R.g2^2))*(R.xi + 1/6)
    γ1 = -(9/4 * R.g2^2 + 3/4 * R.g1^2 - 3*R.yt^2)

    # 2-loop Beta Function
    β2_lH = 1/48*((912+3*sh)*R.g2^6 - (290-sh)*R.g1^2*R.g2^4 - (560-sh) * R.g1^4*R.g2^2 - (380-sh)*R.g1^6)+ (38-8*sh)*R.yt^6 - R.yt^4 * (8/3*R.g1^2 + 32*R.g3^2 + (12-117*sh+108*sh^2)*R.lH)+ R.lH * (-1/8*(181 + 54*sh - 162sh^2)*R.g2^4+ 1/4*(3-18*sh + 54*sh^2)*R.g1^2*R.g2^2 + 1/24*(90+377*sh+162*sh^2)*R.g1^4+ (27+54*sh+27*sh^2)*R.g2^2*R.lH + (9+18*sh+9*sh^2)*R.g1^2*R.lH - (48+288*sh - 324*sh^2 + 624*sh^3 - 324*sh^4)*R.lH^2)+ R.yt^2*(-9/4*R.g2^4 + 21/2*R.g1^2*R.g2^2 - 19/4*R.g1^4+ R.lH*(45/2*R.g2^2 + 85/6*R.g1^2 + 80*R.g3^2 - (36+108*sh^2)*R.lH))
    β2_g1 = 199/18 * R.g1^5 + 9/2 * R.g1^3*R.g2^2 + 44/3*R.g1^3*R.g3^2- 17/6 * sh * R.g1^3 * R.yt^2
    β2_g2 = 3/2 * R.g1^2 * R.g2^3 + 35/6*R.g2^5 + 12*R.g2^3*R.g3^2- 3/2 * sh * R.g2^3 * R.yt^2
    β2_g3 = 11/6 * R.g1^2 * R.g3^3 + 9/2*R.g2^2*R.g3^3 - 26*R.g3^5- 2 * sh * R.g3^3 * R.yt^2
    β2_yt = R.yt * (-23/4 * R.g2^4 - 3/4 * R.g1^2 * R.g2^2 + 1187/216*R.g1^4+ 9*R.g2^2*R.g3^2 + 19/9*R.g1^2*R.g3^2 - 108*R.g3^4+ (225/16*R.g2^2 + 131/16*R.g1^2 + 36*R.g3^2)*sh*R.yt^2+ 6*(-2*sh^2*R.yt^4 - 2*sh^3*R.yt^2*R.lH + sh^2*R.lH^2))
    γ2 = -(271/32 * R.g2^4 - 9/16 * R.g1^2 * R.g2^2 - 431/96 * sh * R.g1^4 - 5/2 * (9/4 * R.g2^2 + 17/12 * R.g1^2 + 8*R.g3^2) * R.yt^2 + 27/4 * sh*R.yt^4- 6 * sh^3 * R.lH^2)
    # Make Total Beta Function
    γ = (1/(16π^2)) * γ1 + (1/(16π^2)^2) * γ2
    g = MakeBeta(γ)
    Bg1, Bg2, Bg3 = g(β1_g1, β2_g1), g(β1_g2, β2_g2), g(β1_g3, β2_g3)
    BlH, Byt = g(β1_lH, β2_lH), g(β1_yt, β2_yt)
    println(β2_lH)
    # Running RGE
    R.lH += h * BlH
    R.yt += h * Byt
    R.g1 += h * Bg1
    R.g2 += h * Bg2
    R.g3 += h * Bg3
    R.t += h
    R.phi = sqrt(2)/R.yt*mt*exp(R.t)
    R.G -= h*γ/(1+γ)
end

# Run generate Array of RGE
function Run(mt::Float64, xi::Float64)::Array{RGE}
    # Initialize
    R = init(mt)
    # Make Container of R (RGE)
    Container = Array{RGE}(length(0:h:N))
    # Julia starts with index 1
    # Copy makes new variable -> Protect Values
    Container[1] = Copy(R)
    for i = 2:length(0:h:N)
        Running(R, mt, xi)
        Container[i] = Copy(R)
    end
    return Container
end

# Extract Gauge from Container
function ExtractGauge(mt::Float64, xi::Float64)::DataFrame
    Cont = Run(mt, xi)
    T = Array{Float64}(length(Cont))
    λ = Array{Float64}(length(Cont))
    Y = Array{Float64}(length(Cont))
    G1 = Array{Float64}(length(Cont))
    G2 = Array{Float64}(length(Cont))
    G3 = Array{Float64}(length(Cont))
    ϕ = Array{Float64}(length(Cont))
    G = Array{Float64}(length(Cont))
    for i=1:length(Cont)
        T[i] = Cont[i].t
        λ[i] = Cont[i].lH
        Y[i] = Cont[i].yt
        G[i] = Cont[i].G
        ϕ[i] = Cont[i].phi
        G1[i] = Cont[i].g1
        G2[i] = Cont[i].g2
        G3[i] = Cont[i].g3
    end
    df = DataFrame(t=T, λ=λ, yt=Y, g1=G1, g2=G2, g3=G3, ϕ=ϕ, G=G)
    return df
end

# Draw Gauge Plots
function RGEPlot()::Array{DataFrame}
    println("---------------------------------------------")
    println("Welcome to RGEPlot")
    println("---------------------------------------------")
    println()
    println("Please Choose draw type")
    println("1. Gauge")
    println("2. Potential")
    println("3. Cosmological Parameter")

    choose = readline(STDIN)
    choose = chomp(choose)
    choose = parse(Int64, choose)

    println("Set mass range and step (ex: 170.81 170.84 4)")

    MR = readline(STDIN)
    MR = split(MR)
    Mmin = parse(Float64, MR[1])
    Mmax = parse(Float64, MR[2])
    Mstep = parse(Int, MR[3])

    println("Set xi value")

    XI = readline(STDIN)
    XI = parse(Float64, XI)

    DArray = Array{DataFrame}(Mstep)
    if choose == 1
        println("Data Processing Start!")
        for i=1:Mstep
            DArray[i] = ExtractGauge(Mmin+(Mmax-Mmin)/(Mstep-1)*(i-1), XI)
        end
        println("Data Processing Finished!")
    end
    return DArray
end
