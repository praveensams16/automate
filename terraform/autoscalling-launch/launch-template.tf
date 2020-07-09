




resource "aws_launch_template" "pricebook-catalog" {
  name = "pricebook-catalog"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = 4
    threads_per_core = 2
  }

  disable_api_termination = true

  ebs_optimized = true
  
  image_id = aws_ami_from_instance.test.id

  instance_initiated_shutdown_behavior = "terminate"

  
  instance_type = "t2.micro"

  

 # license_specification {
 # license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  #network_interfaces {
 # }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring {
    enabled = true
  }
network_interfaces {
    associate_public_ip_address = true
  }

  placement {
    availability_zone = "us-east-1a"
  }

  #ram_disk_id = "test"

  vpc_security_group_ids = ["sg-0ba6a4e5f12deb029"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "pricebook-catalog-autoscalling"
    }
  }

}
