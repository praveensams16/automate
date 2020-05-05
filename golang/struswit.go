package main 

import (
    "fmt"
        )

type sam struct {
    a int
    b int
    }

func main() {
    k:=sam{a:10,b:20}
    switch {
        case k.a+k.b>100:
            fmt.Println("hiii")
        default:
            fmt.Println("byyyeeee")
            }
            }
