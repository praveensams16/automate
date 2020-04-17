from subprocess import  Popen, PIPE
from time import *
from  sys import argv

s=open("/tmp/logs","w")
s1=Popen("echo quit | openssl s_client -connect {0}:443 2> /dev/null | openssl x509 -text -noout ".format(argv[1]),stdout=PIPE,shell=True).communicate()[0]
x=0
s.write(s1)
list=open("/tmp/logs","r").readlines()
for i in list:
    if 'Validity' in  i:
        end=("".join([ i.strip() + ":" for i in list[x+2].split(":") if 'Not' not in i]).strip(" :"))
        print(end)
        k=Popen("date  -d \"{0}\" \"+%s\" ".format(end),stdout=PIPE,shell=True).communicate()[0]
        date=Popen("date",stdout=PIPE,shell=True).communicate()[0]
        print(date)
        k1=Popen("date  -d  \"{0}\" \"+%s\"".format(date),stdout=PIPE,shell=True).communicate()[0]
        print(str(k1) + " --> " +  str(k))
        days=(int(k1)-int(k))/(60*60*24)
        print(days)
    x+=1


