package main

import (
	"fmt"
	"math"

	"github.com/Axect/csv"
)

func main() {
	Writefile()
}

func Writefile() {
	var A [1E+06]float64
	a := &A
	for i := range a {
		a[i] = math.Pow(float64(i), 2)
	}
	NewA := Convert(A)
	csv.Write(NewA, "Data/test.csv")
}

func Convert(List [1E+06]float64) [][]string {
	ToWrite := make([][]string, 1E+06, 1E+06)
	for i := range ToWrite {
		ToWrite[i] = []string{fmt.Sprint(List[i])}
	}
	return ToWrite
}
