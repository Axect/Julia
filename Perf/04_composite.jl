using BenchmarkTools

struct Point
    x
    y
end

struct ConcretePoint
    x::Float64
    y::Float64
end

struct PointWithAbstract
    x::AbstractFloat
    y::AbstractFloat
end

struct ParametricPoint{T <: AbstractFloat}
    x::T
    y::T
end

function sumsqr_points(a)
    s = 0.0
    for t in a
        s = s + t.x^2 + t.y^2
    end
    return s
end

function sumsqr_points_simd(a)
    s = zero(eltype(a[1].x))
    @simd for t in a
        s = s + t.x^2 + t.y^2
    end
    return s
end


p_array = [Point(rand(), rand()) for i in 1:1000_000];
cp_array = [ConcretePoint(rand(), rand()) for i in 1:1000_000];
pa_array = [PointWithAbstract(rand(), rand()) for i in 1:1000_000];
pp_array = [ParametricPoint(rand(), rand()) for i in 1:1000_000];

@btime sumsqr_points(p_array);
@btime sumsqr_points(cp_array);
@btime sumsqr_points(pa_array);
@btime sumsqr_points(pp_array);
@btime sumsqr_points_simd(p_array);
@btime sumsqr_points_simd(cp_array);
@btime sumsqr_points_simd(pa_array);
@btime sumsqr_points_simd(pp_array);

