from jinja2 import Environment, FileSystemLoader


servername="google.com"

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)

template = env.get_template('file.txt')

output = template.render(servername=servername,location="chennai")
print(output)
