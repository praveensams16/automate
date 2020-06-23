output  "vpc" {
  value = aws_vpc.local.id
  }

output "subnet" {
  value = aws_subnet.local.id
  }

output "security" {
  value = aws_security_group.traffic.id
  }
