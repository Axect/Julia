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

// Output : 243.41662ms = 0.243 sec
