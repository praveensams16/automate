resource "aws_ebs_volume" "cloudra" {
  availability_zone = "us-east-1a"
  size              = 40

  tags = {
    Name = "cloudra"
  }
}
