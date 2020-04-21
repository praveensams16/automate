resource "aws_subnet" "local" {
  vpc_id     = aws_vpc.local.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}
