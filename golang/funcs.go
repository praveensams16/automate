package main

type nums struct {
	a, b int
}

func (k *nums) add(a int) int {
	j := k.a + k.b + a + 10
	return j
}

func main() {
	k := nums{a: 10, b: 20}
	k.add(10)

}
