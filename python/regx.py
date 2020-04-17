from re import search

s=open("./src/main/resources/application.properties","r").readlines()

for i in s:
    if 'memory' in i and 'In' in i:
        set=1
    elif len(i) == 1:
        set=0
    if set == 1:
        if 'memory' in i:
            print(i.strip())
        else:
            print(i.replace('#','').strip())

