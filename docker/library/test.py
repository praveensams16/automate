from ansible.module_utils.basic import *
from socket import *

def checkifopen(ip,port):
    s=socket(AF_INET,SOCK_STREAM)
    try:
        s.connect((ip,int(port)))
        s.shutdown(0.00001)
        s.settimeout(0.00001)
        return True
    except Exception as e:
        print(e)
        return False

if checkifopen("www.google.com",81) == True:
    lists="site is up"
else:
    lists="site is down"

print(lists)
