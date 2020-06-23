resource "aws_subnet" "local" {
  vpc_id     = aws_vpc.local.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${var.region}a"

  tags = {
    Name = "Main"
  }
}
