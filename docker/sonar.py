from sys import argv
from re import search

s=argv[1] + "/" + "pom.xml"

sonar="""

	<properties>

	<sonar.jdbc.username>admin</sonar.jdbc.username>

  <sonar.jdbc.password>admin</sonar.jdbc.password>

  <sonar.host.url>http://127.0.0.1:81</sonar.host.url>

   """

red=open(str(s),"r").readlines()

for i in red:
    if i is not None and search(r'\<properties\>',i):
        print(sonar)
    else:
        print(i)

