resource "aws_ebs_volume" "cloudra" {
  availability_zone = "${var.region}a"
  size              = 40

  tags = {
    Name = "cloudra"
  }
}
