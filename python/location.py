from urllib2 import * 
from time import sleep
from sys import argv 


def valid(url):
    if len(url) > 2:
        url=str(url).strip()
    else:
        return -2
    try:
        for i in range(3):
            if urlopen(url).getcode() == 200:
                pass
                sleep(1)
            else:
                return -4
    except:
        return -1
    return 0





if __name__ == '__main__':
    fields = {"location": {"required": True, "type": "str"} }
    module = AnsibleModule(argument_spec=fields)
    location = os.path.expanduser(module.params['location'])
    if valid(location) == 0:
        lists="site is up"
    elif valid(location]) == -2:
        lists="no url provided"
    else:
        lists="site is down"
    module.exit_json(msg=list)

