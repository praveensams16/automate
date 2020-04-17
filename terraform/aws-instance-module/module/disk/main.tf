resource "aws_ebs_volume" "vol1" {
    availability_zone = "us-east-1a"
    size              = 40

  tags = {
       Name = var.new-vol
         }
  }
