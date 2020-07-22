#!/usr/local/bin/python3
from boto3 import *
import json

AWS_ACCESS_KEY_ID='AKIA2KWUNN'
AWS_SECRET_ACCESS_KEY='8NSPcbMSWBxXUmBzz'
    
def lambda_handler(event, context):
    ip_list=[]
    list=client('ec2')
    response=list.describe_instances(
        Filters = [
            {
                "Name" : "tag:clone",
                "Values" : ["yes"]
            }
        ]
    ).get(
        'Reservations'
    )
    for i in response:
        ip_list.append(i['Instances'][0]['PublicIpAddress'])
    return {
    'statusCode': 200,
    'body': json.dumps(ip_list)
    }