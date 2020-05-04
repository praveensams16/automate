package main

import  (
    "fmt"
        )

type  sam struct {
    name string
    location string
        }

type mult struct {
    a, b int
        }


func (r*mult) add() int {
    return r.a * r.b
    }

func main() {
    r1:=sam{name: "praveen", location: "chennai"}
    fmt.Println(r1.name)
    k:=mult{a:2,b:3}
    fmt.Println(k.add())
    }
