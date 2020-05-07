package main 

import (
    "fmt"
        )

type sam struct {
    a , b int
    }



func (s*sam) add(c chan int ) {
        c <- s.a + s.b
        }


func main() {
    c:=make(chan int)
    f:=sam{a:10,b:30}
    go f.add(c)
    fmt.Println(<-c)
    }
    
