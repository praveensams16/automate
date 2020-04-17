#!/bin/python
from  subprocess import Popen,PIPE
from sys import argv

def dumps(port):
    try:
        s=Popen("lsof -i :{0} | grep -v PID ".format(port),stdout=PIPE,shell=True).communicate()[0].split()[1]
        kill=Popen("jmap -dump:format=b,file=/mnt/dump/logs-$(date +%d%b%y-%H%M).bin {0}".format(s),stdout=PIPE,shell=True).communicate()
        print(kill)
    except Exception as e:
        print(str(e) + "\n")

dumps(argv[1])

