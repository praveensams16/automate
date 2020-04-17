package main

import (
		"fmt"
		"strconv"
			)

func main() {

		var a [5]string

    for i:=0 ; i < 5 ;i ++ {
				l := strconv.Itoa(i)
				a[i] = "sam" + l 
		}

		fmt.Println(a)
	}


