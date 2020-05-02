package main

import (
    "fmt"
        )

var s string
var k []string

func main() {
    for i:=0;i<4;i++ {
   fmt.Scan(&s)
   k=append(k,s)
   }
   fmt.Println(k)
   }
