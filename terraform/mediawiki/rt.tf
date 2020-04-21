resource "aws_route_table" "route" {
  vpc_id = aws_vpc.local.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "main"
  }
}
