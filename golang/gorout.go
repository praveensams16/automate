package main 

import  (
        "fmt"
        "time"
        )


func main() {
    go sam("sam")

    go sam("now")
    time.Sleep(100 * time.Millisecond)
        }


func sam(s string) {
    fmt.Println(s)
    time.Sleep(100 * time.Millisecond)
    }


