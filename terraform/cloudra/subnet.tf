resource "aws_subnet" "cloudra" {
  vpc_id     = aws_vpc.cloudra.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "cloudra"
  }
}
