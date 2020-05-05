package main 

import (
    "fmt"
        )

func add(s int,c chan int) {
    c <- s*10
    }

func main() {
    c := make(chan int)
    go add(3,c)
    go add(3,c)
    go add(13,c)
    y:=<-c+<-c+<-c
    fmt.Println(y)
    }

