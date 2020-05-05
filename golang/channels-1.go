package main 

import "fmt"


func runns(s int,c chan int) {
    c <- s*10+s+10
    }

func main() {
    var c = make(chan int)
    go runns(10,c)
    fmt.Println(<-c)
    }
