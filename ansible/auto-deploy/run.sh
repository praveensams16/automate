#!/bin/bash

k=$(aws ec2 describe-instances --filters "Name=tag:env,Values=test" | perl -ane 'BEGIN{%d};if(/(?<=PublicIp\"\:\s\").*(?=\")/) {print $&."\n"}' | uniq )

for i in $k; 
do
 ansible-playbook -i inventory s3.yml   -e "host=$i"
done


