package main

import (
  "log"
  "os/exec"
  "fmt"
  "strings"
  "regexp"
  )

func main() {
    cmd := exec.Command("ls", "-lah")
    out, err := cmd.CombinedOutput()
    if err != nil {
        log.Fatalf("cmd.Run() failed with %s\n", err)
    }
    h:=string(out)
    s:=strings.Split(h,"\n")
    for i:=0;i<len(s);i++ {
      k,_:=regexp.MatchString("b",s[i])
      if k {
      fmt.Println("-->" + s[i])
      }
      }
}
