from ansible.module_utils.basic import *
from socket import *

def checkifopen(ip,port):
    s=socket(AF_INET,SOCK_STREAM)
    try:
        s.connect((ip,int(port)))
        s.settimeout(5)
        s.shutdown(2)
        return True
    except Exception as e:
        print(e)
        return False

if __name__ == '__main__':
    fields = {"ipaddress": {"required": True, "type": "str"}, "port":  {"required": True } }
    module = AnsibleModule(argument_spec=fields)
    ipaddress = os.path.expanduser(module.params['ipaddress'])
    port = int(os.path.expanduser(module.params['port']))
    if checkifopen(ipaddress,port) == True:
        lists={"failed": False, "msg": "!!!!!    site is up     !!!!!!"}
    else:
        lists={"failed": True, "msg": "!!!!!     site is down    !!!!!!"}
    module.exit_json(msg=lists)

