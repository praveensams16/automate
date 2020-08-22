resource "aws_launch_template" "pricebook-catalog-launch-as" {
  name = "pricebook-catalog-launch-as"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 50
    }
  }
network_interfaces {
    associate_public_ip_address = true
    security_groups = ["sg-0d5a9d104d516d8ad"]
  }

  image_id = aws_ami_from_instance.stage.id

  instance_initiated_shutdown_behavior = "terminate"

  
  instance_type = "c5.2xlarge"

    key_name = "praveensam"

  #ram_disk_id = "test"

  #vpc_security_group_ids = ["sg-0d5a9d104d516d8ad"]
  #default_version = "2"

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pricebook-catalog-autoscalling"
    }
  }
  
}
