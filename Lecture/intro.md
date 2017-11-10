<h1 style="text-align:center">Julia Lecture</h1>
<h3 style="text-align:center">- Intro to Julia</h3>
<p style="text-align:right"><b>Tae Geun Kim</b></p>

## 1. Intro to Julia

* <a href=http://edeftg.dothome.co.kr/julia-intro/>Axect's Blog</a>

## 2. Speed Test

### 1) Python
```Python
import numpy as np
import time

def Test():
    start = time.time()
    A = np.zeros(10**8)
    for i in range(len(A)):
        A[i] = i**2
    end = time.time()
    return end-start

print(Test())

# Output : 37.91
```

### 2) Julia
```Julia
function TestSpeed()
    A = zeros(10^8)
    for i = 1:length(A)
        A[i] = i^2
    end
end

@time TestSpeed()

# Output: 0.39 seconds
```

### 3) Go
```Go
package main

import (
	"fmt"
	"time"
)

func main() {
	start := time.Now()
	var A [1E+08]int
	a := &A
	for i := range A {
		a[i] = i * i
	}
	elapsed := time.Since(start)
	fmt.Println(elapsed)
}
// Output : 243.41662ms = 0.243s
```

## 3. Basic Use

### 1) REPL 
* Open julia REPL by typing `julia`.

### 2) Manage Package 
1. Open julia REPL
2. `Pkg.add("Package Name")`

### 3) Include
1. Make .jl file (ex: Tutorial.jl)
2. Open julia REPL at folder which contain .jl file
3. `include("Tutorial.jl")`
4. Then use it.