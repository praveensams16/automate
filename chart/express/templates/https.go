package main

import (
	"fmt"
	"net/http"
)

func main() {
	resp, err := http.Get("https://www.google.com")
	if err != nil {
		fmt.Println("No error")
	}
	fmt.Println(resp)
}
