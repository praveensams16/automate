from ansible.module_utils.basic import *
from  subprocess import Popen,PIPE

def finds(port):
    try:
        s=Popen("lsof -i :{0} | grep -v PID ".format(port),stdout=PIPE,shell=True).communicate()[0].split()[1]
        return s
    except Exception as e:
        print(e)



if __name__ == '__main__':
    fields = {"port": {"required": True} }
    module = AnsibleModule(argument_spec=fields)
    port = int(os.path.expanduser(module.params['port']))
    rets=finds(port)
    module.exit_json(msg=rets)

