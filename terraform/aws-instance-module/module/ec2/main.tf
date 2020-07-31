data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  availability_zone = "${var.region}a"
  associate_public_ip_address = true

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}


resource "aws_ebs_volume" "example" {
  availability_zone = "${var.region}a"
  size              = 1
}

output "ip" {
value = aws_instance.web.public_ip
}