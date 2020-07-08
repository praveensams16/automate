data "aws_instance" "sam" {
  instance_tags = {
    clone = "yes"
    }
    }

resource "aws_ami_from_instance" "example" {
  name               = "terraform-example"
  source_instance_id = data.aws_instance.sam.id
  }

