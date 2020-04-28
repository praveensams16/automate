resource "aws_instance" "cloudra" {
  ami   = "ami-0015b9ef68c77328d" # us-west-2
  instance_type = "t2.micro"
  key_name = "cloudra"
  subnet_id = var.subnet
  security_groups = var.security
  user_data = "${file("./module/ec2/sam.sh")}"
}
