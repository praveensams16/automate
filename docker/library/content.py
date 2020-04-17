from ansible.module_utils.basic import *
import os, json
import  sys
from re import *
from jinja2 import Environment, FileSystemLoader

def loads(location,content):
    os.chdir("/mnt")
    file_loader = FileSystemLoader('templates')
    env = Environment(loader=file_loader)
    template= env.get_template(location)
    output=template.render(content=content)
		

if __name__ == '__main__':
    fields = {"location": {"required": True, "type": "str"} ,"content":   {"required": True, "type": "str"}}
    module = AnsibleModule(argument_spec=fields)
    location = os.path.expanduser(module.params['location'])
    content = os.path.expanduser(module.params['content'])
    lists=loads(location,content)
    module.exit_json(msg=lists)
