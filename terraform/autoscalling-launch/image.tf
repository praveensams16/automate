locals {
  timestamp = "${timestamp()}"
}

data "aws_instance" "sam" {
  instance_tags = {
    Name = "autoscalling"
    }
    }

resource "aws_ami_from_instance" "test" {
  name               = "pricebook-catalog-staging_${local.timestamp}"
  source_instance_id = data.aws_instance.sam.id
  }

