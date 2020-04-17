from ansible.module_utils.basic import *
from  subprocess import Popen,PIPE

def dumps(port):
    try:
        s=Popen("lsof -i :{0} | grep -v PID ".format(port),stdout=PIPE,shell=True).communicate()[0].split()[1]
        kill=Popen("jmap -dump:format=b,file=/mnt/dump/logs-$(date +%d%b%y-%H%M).bin {0}".format(s),stdout=PIPE,shell=True).communicate()
        print(kill)
    except Exception as e:
        print(e)



if __name__ == '__main__':
    fields = {"port": {"required": True} }
    module = AnsibleModule(argument_spec=fields)
    port = int(os.path.expanduser(module.params['port']))
    rets=dumps(port)
    module.exit_json(msg=rets)

