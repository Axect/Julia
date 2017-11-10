<h1 style="text-align:center">Julia Lecture</h1>
<h3 style="text-align:center">- Linear Algebra</h3>
<p style="text-align:right"><b>Tae Geun Kim</b></p>

## 1. Array

### 1) Append!

```julia
A = [1,2,3]
append!(A, 4)

B = [4,5,6]
append!(A, B)
```

### 2) Range

```julia
X = 0:0.1:1
typeof(X)

Y = [0:0.1:1]
typeof(Y)

Z = [0:0.1:1...]
typeof(Z)w	
```

### 3) Length

```julia
A = [1,2,3]
length(A)

B = [1:3]
length(B)

C = [1:3...]
length(C)
```

### 4) Zeros

```julia
A = zeros(3)
for i = 1:length(A)
	A[i] = i
end
```

## 2. For Loop

