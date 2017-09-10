<h1 style="text-align:center">Julia Lecture</h1>
<h3 style="text-align:center">- Basic Grammar</h3>
<p style="text-align:right"><b>Tae Geun Kim</b></p>

## 1. Basic Print

### 1) Println
```julia
println("Hello, World!")
```

### 2) Printf?

* In Go,
    ```Go
    Name := "Tae Hyeon"
    fmt.Printf("Hello, %s\n", Name)
    ```

* In Julia, there are not printf. But,
    ```julia
    Name = "Tae Hyeon"
    println("Hello, $(Name)")
    ```

#### - Quiz: Let's make brief self introduction.

* Name
* Job
* Phone number

## 2. Basic Type

* In julia, there are many types.
* For basic, `String`, `Int`, `Float64`, `Array{Int}`, `Array{Float64}`

```julia
a = 3;
typeof(a)

b = 2.;
typeof(b)

typeof(pi)

A = [1,2,3];
typeof(A)

B = [1., 2., 3];
typeof(B)

C = [1 2 3];
typeof(C)

D = [1 2 3; 4 5 6];
typeof(D)

E = [1, 2., "Hi"];
typeof(E)
```

* Converting type is confusing

```julia
# ---------------------------------
# Basic
# ---------------------------------

A = 3
Float64(A)

B = 3.
Int(B)

C = 3.1
Int(C)

# ---------------------------------
# String
# ---------------------------------

D = 1
String(D)
string(D)

E = "123"
Int(E)
Float64(E)
parse(Int, E)
parse(Float64, E)
```

## 3. Operation

### 1) Normal

```julia
a = 3; b = 2;

# +
a + b

# *
a * b
2a
3b

# ^
a^b

# /
a / b
```

### 2) Vector

```julia
x = [1,2,3]; y = [4,5,6]
x.*y
```

## 3. Linear Algebra

### 1) Basic functions

* Julia has all functions of linear algebra
* det, trace, inv,  
```julia
A = [1 2; 3 2]
B = [2 1; 2 3]
# Determinant
det(A)

# Inverse
inv(A)

# Transpose
A'

# Trace
trace(A)

# Multiplication
A*B
A.*B

# Division
A/B
A./B
```