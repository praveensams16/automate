
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance-type
  subnet_id = var.subnet
  availability_zone = "${var.region}a"

  tags = {
    Name = "HelloWorld"
  }
}


