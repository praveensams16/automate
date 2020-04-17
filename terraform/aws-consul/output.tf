output "vpc" {
	value=aws_vpc.local.id
    }
output "subnet" {
    value=aws_subnet.private.id
	}

output "running" {
    value="${module.ec2.instance}"
    }
 
