package main

func main() {
	var A [1E+08]int
	a := &A
	for i := range A {
		a[i] = i * i
	}
}

// Output : 243.41662ms = 0.243 sec
