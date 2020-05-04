package main 

import  ( 
    "fmt"
        )

var i int
func ints() func() int {
    return func() int {
            i++
            return i+2
            }
            }

func main() {
    ins:=ints()
    fmt.Println(ins())   
    fmt.Println(ins())   
    fmt.Println(ins())   
    fmt.Println(ins())   
    }
        
