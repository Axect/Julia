# Basic Operation
1 + 1

2^3

5 % 2 

5 / 2

5 // 2

5//2 * 2

typeof(5//1)

# Linear Algebra

## Array
x = [1,2,3]

## Matrix
y = [1 2 3]

## Matrix Operation

A = [1 2; 3 4]

det(A) # Determinant

A' # Transpose

A[1,1] # A_11

inv(A) # Inverse

B = [5 6; 7 8]

A*B # Matrix Product

A.*B # Elementwise Product

# Quiz

A = [2 3; 3 -1]
B = [1; 2]
X = inv(A)*B

2*X[1] + 3*X[2]

## Function

f(x) = x^2

f(3)

f("Hi")

function f(x::Int)
  return x^2
end

f(3)

f("Hi")

function f(x::Int, y::Float64)
  return x + y
end

function D(f::Function)
  h = 1e-6
  return x -> (f(x+h) - f(x)) / h
end

g = D(sin)

g(0)

## Object-Oriented-Programming

mutable struct Vector3{T<:Real}
  x :: T
  y :: T
  z :: T
end

mutable struct Coordinate
  t :: Float64
  X :: Vector3
  P :: Vector3
end

V1 = Vector3(0., 1., 2.)
V2 = Vector3(1., 2., 3.)

# Method Overloading
import Base.+

function (+)(v1, v2 :: Vector3)
  V = Vector3(0.,0.,0.)
  V.x += v1.x + v2.x
  V.y += v1.y + v2.y
  V.z += v1.z + v2.z
  return V
end

#import Base.*
#
#function (*)(c :: Float64, v :: Vector3)
#  v.x *= c
#  v.y *= c
#  v.z *= c
#end

c = 2.

c * V1

function Inner(v1, v2 :: Vector3)::Float64
  return (v1.x * v2.x + v1.y * v2.y + v1.z * v2.z)
end

V1 = Vector3(1.,2.,3.)
V2 = Vector3(2.,1.,-1.)

Inner(V1,V2)
