package main

import (
    . "fmt"  
    "os/exec"
        )

func main() {
    d:=exec.Command("ls","/mnt")
    k,_:=d.Output()
   Println(k)
    }
