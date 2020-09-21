struct Vec3D{T}
    x::T
    y::T
    z::T
end

struct Vec2D{T}
    x::T
    y::T
end

# Real is slow
function Projection(V::Vec3D)::Vec2D{Real}
    Q = Vec2D{Real}(0,0)
    Q.x = V.x
    Q.y = V.y
    return Q
end

import Base.+

+(V::Vec3D, W::Vec2D) = Vec2D(V.x+W.x, V.y+W.y)