resource "aws_subnet" "local-front" {
  vpc_id     = aws_vpc.local.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.region}a"
  tags = {
     key = kubernetes.io/cluster/example
     Value = shared
      }
}
resource "aws_subnet" "local-back" {
  vpc_id     = aws_vpc.local.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}b"
  tags = {
     key = kubernetes.io/cluster/example
     Value = shared
      }
}
