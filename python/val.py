from time import * 
def love():
    n=50
    s=0
    e=20
    for i in range(s,e):
        k=" "
        print( k*(n-i) + "i" + str("love"*i) + " you "+ "monisha")
        sleep(0.3)
        if i == 19:
            while i > 0:
                print( k*(n-i) + "i" + str("love"*i) + " you "+ "monisha")
                sleep(0.3)
                i=i-1
    
while True:
		love()
 
