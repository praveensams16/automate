output  "vpc" {
  value = aws_vpc.local.id
  }

output "subnet" {
  value = aws_subnet.local.id
  }
