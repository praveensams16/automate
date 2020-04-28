resource "aws_internet_gateway" "cloudra" {
  vpc_id = aws_vpc.cloudra.id

  tags = {
    Name = "main"
  }
}
