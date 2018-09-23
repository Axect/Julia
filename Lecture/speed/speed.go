package main

import "fmt"

func main() {
	var A [1E+08]uint
	var s uint
	a := &A
	for i := range A {
		a[i] = 2*uint(i) + 1
	}
	for _, e := range a {
		s += e
	}
	fmt.Println(s)
}

// Output : 243.41662ms = 0.243 sec
