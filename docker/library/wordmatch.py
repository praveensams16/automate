from ansible.module_utils.basic import *


def valid(op):
    ignore=['\\spool\\prtprocs\\','\\spool\\drivers\\','\\spool\\vdirs\\','\\users\\','\\documents and settings\\','\\windows\\temp\\','\\data\\definitions\\ipsdefs\\','\\config.msi\\\w*\.rbf','\\ProgramData\\Symantec\\Symantec','/bin/bah']
    x=0
    for i in op:
        if i in ignore:
            x=x+1
    if len(op) != x:
        return "Need reboot"
    else:
        return "No Need reboot"



if __name__ == '__main__':
    fields = {"op": {"required": True } }
    module = AnsibleModule(argument_spec=fields)
    op = os.path.expanduser(module.params['op'])
    lists=valid(op)
    module.exit_json(msg=lists)


