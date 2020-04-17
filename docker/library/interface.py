from ansible.module_utils.basic import *
from  subprocess import *
from re import search

def extract(command,regex):
    s=Popen(command,stdout=PIPE,shell=True).communicate()
    for i in s:
        try:
            l=search(regex,i)
            if l:
                return l.group().strip()
        except Exception as e:
            print(e)

if __name__ == '__main__':
    fields = {"name": {"required": True, "type": "str"}, "regex":  {"required": False, "type": "str"} }
    module = AnsibleModule(argument_spec=fields)
    command = 'ip a show ' + str(os.path.expanduser(module.params['name']))
    regex='(?<=inet\s)\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
    rets=extract(command,regex)
    if rets:
        lists=rets
    else:
        lists={"failed": True, "msg": rets}
    module.exit_json(msg=lists)

