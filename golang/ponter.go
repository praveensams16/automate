package main

import (
    "fmt"
        )


type runns struct {
    ap, sp  int
    }

func  (p *runns) testing()  {
        p.ap=p.ap + 1
        p.sp=p.sp + 1
        }

func main() {
    s:=runns{1,2}
    s.testing()
    fmt.Println(s)
    }
