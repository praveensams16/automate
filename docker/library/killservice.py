from ansible.module_utils.basic import *
from  subprocess import Popen,PIPE
from re import search
from os import remove
from time import sleep

def killservice(port):
    try:
        s=Popen("lsof -i :{0}| grep -v PID".format(port),stdout=PIPE,shell=True).communicate()[0].split()[1]
    except IndexError as e: 
        return "Service is not running"
    res=Popen("kill -15 {0}".format(s),stdout=PIPE,shell=True).communicate()
    sleep(5)
    try:
        s=Popen("lsof -i :{0}| grep -v PID".format(port),stdout=PIPE,shell=True).communicate()[0].split()[1]
    except IndexError as e: 
        return "Service Stopped"

if __name__ == '__main__':
    fields = {"port": {"required": True} }
    module = AnsibleModule(argument_spec=fields)
    port = int(os.path.expanduser(module.params['port']))
    rets=killservice(port)
    module.exit_json(msg=rets)

