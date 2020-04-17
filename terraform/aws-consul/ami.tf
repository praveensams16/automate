data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["self"]

  filter {
    name   = "name"
    values = ["ami-00000123"]
  }

}
