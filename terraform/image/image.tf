#locals {
  #timestamp = "${timestamp()}"
#}

#data "aws_instance" "sam" {
 # instance_tags = {
  #  clone = "yes"
  #  }
 #   }

#resource "aws_ami_from_instance" "stage" {
 # name               = "pricebook-catalog-staging_${local.timestamp}"
 # source_instance_id = data.aws_instance.sam.id
 # }

#