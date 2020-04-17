import urllib3
from subprocess import Popen,PIPE
from time import sleep
from funmail import send_email
from os import path,mknod,remove
http = urllib3.PoolManager()
url='http://10.65.30.34:8080'
#eaders = urllib3.util.make_headers(basic_auth='tasclientsid:password')
#eaders.update({"password": "secret","username":"user","grant_type":"password"})
try:
    r = http.request('GET', url)
    if not path.isfile('/tmp/lock'):
        send_email("Test application is back","Test TAS application is back")
        mknod('/tmp/lock')
except Exception as e:
    send_email("Test application is Down","Test applicaiton is not responding\n#######################################################################################\n{0}\n#######################################################################################\n\tKindly check".format(e))
    if path.isfile('/tmp/lock'):
        remove('/tmp/lock')
