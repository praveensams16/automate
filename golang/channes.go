package main 

import (
    "fmt"
        )

func sam(s int,c chan int) {
   c <- s +10
   }

func main() {
    c := make(chan int, 2)
    go sam(10,c)
    go sam(10,c)
    go sam(10,c)
    go sam(10,c)
    fmt.Println(<-c)
    fmt.Println(<-c)
    fmt.Println(<-c)
    fmt.Println(<-c)
    }
