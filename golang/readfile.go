package main

import (
	"bufio"
	"fmt"
    "strings"
	"log"
	"os"
    "regexp"
)
 
func main() {
	file, err := os.Open("/etc/passwd")
 
	if err != nil {
		log.Fatalf("failed opening file: %s", err)
	}
 
	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)
	var txtlines []string
 
	for scanner.Scan() {
		txtlines = append(txtlines, scanner.Text())
	}
 
	file.Close()
 
	for _, eachline := range txtlines {
           split := strings.Split(eachline,":")
           for i:=0;i<len(split);i++ {
            k,_ := regexp.MatchString("bash",split[i]) 
            if k {
                fmt.Println(split)
            }
            }
	}
}
