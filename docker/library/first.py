#!/usr/bin/python

from ansible.module_utils.basic import *
import os, json
import  sys
from re import *

k=[]


def extract(location):
    s=open(location,"r")
    for i in s.readlines():
        s=search(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}',i)
        if s:
            k.append(s.group())
    t=str(' , '.join(k))
    if t:
        return {'name': t}
    else:
        return {'name': "failure"}


		

if __name__ == '__main__':
    fields = {"location": {"required": True, "type": "str"}	}
    module = AnsibleModule(argument_spec=fields)
    location = os.path.expanduser(module.params['location'])
    lists=extract(location)
    module.exit_json(msg=lists)
