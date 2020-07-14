package main

import (
	"fmt"
)

func sam(i int) int {
	return i * 3
}

func main() {
	s := sam(10)
	fmt.Println(s)

}
