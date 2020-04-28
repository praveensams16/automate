resource "aws_route_table" "cloudra" {
  vpc_id = aws_vpc.cloudra.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cloudra.id
  }


  tags = {
    Name = "cloudra"
  }
}
