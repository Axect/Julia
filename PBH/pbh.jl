const Mp = 1.221 * 1E+19
const MpR = 2.4 * 1E+18 
const MW = 80.385
const MZ = 91.1876
const MH = 125.09
const alphasMZ = 0.1182
const h = 1E-04
const step = 1E+04 * 44

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

function init(R::RGE)
    R.t = 0.
	R.lH = 0.12604 + 0.00206 * (MH - 125.15) - 0.00004 * (mt - 173.34)
	R.yt = (0.93690 + 0.00556 * (mt - 173.34) - 0.00003 * (MH - 125.15) - 0.00042 * (alphasMZ - 0.1184) / 0.0007)
	R.g3 = 1.1666 + 0.00314 * (alphasMZ - 0.1184) / 0.007 - 0.00046 * (mt - 173.34)
	R.g2 = 0.64779 + 0.00004 * (mt - 173.34) + 0.00011 * (MW - 80.384) / 0.014
	R.g1 = 0.35830 + 0.00011 * (mt - 173.34) - 0.00020 * (MW - 80.384) / 0.014
	R.phi = sqrt(2.) / R.yt * mt * exp(R.t)
	R.G = 1.
end

function MakeBeta(γ)
    return function f(f1::Float64, f2::Float64)::Float64
        temp = 1 / (16π^2) * f1 + 1 / (16 * π^2)^2 * f2
        return temp / (1 + γ)
    end
end

function Running(R::RGE, mt::Float64, xi::Float64)
    hg = sqrt(2) / R.yt * mt * exp(R.t)
    sh = (1 + xi * hg^2 / MspR^2) / (1 + (1 + 6xi) * xi * hg^2 / MpR^2)
    
    # 1-loop Beta Function
    β1_g1 = (81 + sh) / 12 * R.g1^3
    β1_g2 = -(39 - sh) / 12 * R.g2^3
    β1_g3 = -7 * g3^3
    β1_lH = 6(1 + 3sh^2) * R.lH^2 + 12R.lH * R.yt^2 - 6R.yt^4 - 3R.lH * (3R.g2^2 + R.g1^2) + 3 / 8 * (2R.g2^4 + (R.g1^2 + R.g2^2)^2)
    β1_yt = R.yt * ((23 / 6 + 2 / 3 * sh) * R.yt^2 - (8 * R.g3^2 + 9 / 4 * R.g2^2 + 17 / 12 * R.g1^2))
    # β1_xi = (6(1+sh)*R.lH + 6*R.yt^2-3/2*(R.g1^2+3*R.g2^2))*(R.xi + 1/6)
    γ1 = -(9 / 4 * R.g2^2 + 3 / 4 * R.g1^2 - 3 * R.yt^2)

    # 2-loop Beta Function
    β2_g1 = 0.
    β2_g2 = 0.
    β2_g3 = 0.
    β2_lH = 0.
    β2_yt = 0.
    γ2 = 0.

    # Make Total Beta Function
    γ = γ1 + γ2
    g = MakeBeta(γ)
    Bg1, Bg2, Bg3 = g(β1_g1, β2_g1), g(β1_g2, β2_g2), g(β1_g3, β2_g3)
    BlH, Byt = g(β1_lH, β2_lH), g(β1_yt, β2_yt)

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