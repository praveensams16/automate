package main

import "fmt"

func add(i int) int {

	return i + 2
}

func main() {
	s := add(12 + 3)
	fmt.Println(s)
}
