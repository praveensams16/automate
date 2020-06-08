resource "aws_subnet" "local-front" {
  vpc_id     = aws_vpc.local.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.region}a"
  tags = {
     "kubernetes.io/cluster/example" = "shared"
      }
}
resource "aws_subnet" "local-back" {
  vpc_id     = aws_vpc.local.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}b"
  tags = {
     "kubernetes.io/cluster/example" = "shared"
      }
}
