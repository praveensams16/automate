resource "aws_security_group" "cloudra" {
  name        = "cloudra"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.cloudra.id

  ingress {
    description = "22 port anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "cloudra"
    from_port   = 7180
    to_port     = 7180
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
