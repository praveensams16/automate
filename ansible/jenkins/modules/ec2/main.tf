resource "aws_instance" "foo" {
  ami           = "ami-04590e7389a6e577c"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = var.network
    device_index         = 0
  }
   key_name= var.public == "yes" ? "deployer-key" : "False" 

   user_data = <<EOF
				#!/bin/bash
				yum install git -y
				amazon-linux-extras install ansible2 -y
				ansible-pull -i localhost  -U https://github.com/praveensams/seera-ansible.git environment.yml
			EOF 

  credit_specification {
    cpu_credits = "unlimited"
  }
	tags = {
	Name = var.tags
	}
}

resource "aws_eip" "lb" {
  instance = aws_instance.foo.id
  vpc      = true
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    =  var.security
  network_interface_id = var.network
}
