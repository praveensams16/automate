package main

import (
	"fmt"
	"io/ioutil"
)

func main() {
	s := make(map[int]int)
	for i := 0; i < 4; i++ {
		s[i+1] = i + 2
	}
	dat, err := ioutil.ReadFile("/etc/passwd")
	fmt.Print(string(dat))
	fmt.Println(err)
	fmt.Println(s)
}
