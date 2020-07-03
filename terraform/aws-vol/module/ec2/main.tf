resource "aws_instance" "foo" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  subnet_id =  var.subnet
  user_data =  var.data
  availability_zone = "${var.region}a"
  associate_public_ip_address = true
  key_name = "deployer-key1"
  count = var.counts
  security_groups = [var.security]
  tags = {
    Name = "praveen"
    }
}

