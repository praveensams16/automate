from jinja2 import Template

num=10
name="pondy"
name1 = """
{% if num == 10 %}
Sub the variable in the right place {{ name }}
{% else %}
bye bye 
{% endif  %}
"""

tm = Template(name1)
msg = tm.render(name=name,num=10)

print(msg)
