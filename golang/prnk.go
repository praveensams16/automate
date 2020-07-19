package main

import (
	"fmt"
)

type runs struct {
	a, b int
}

func (r runs) sam(i int) int {
	return i*3 + r.a + r.b
}

func main() {
	r := runs{20, 10}
	s := r.sam(10)
	fmt.Println(s)
}
