
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
  }


  
  #image_id = aws_ami_from_instance.test.id

  image_id = "ami-0363c8a1890ea996c"

  instance_initiated_shutdown_behavior = "terminate"

  
  instance_type = "t2.micro"

    key_name = "praveensam"

  #ram_disk_id = "test"

  #vpc_security_group_ids = ["sg-0ba6a4e5f12deb029"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pricebook-catalog-autoscalling"
    }
  }
  
}
