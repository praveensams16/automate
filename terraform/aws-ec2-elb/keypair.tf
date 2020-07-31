resource "aws_key_pair" "deployer" {
  key_name   = "praveen1"
  public_key = file("/Users/laksh/.ssh/id_rsa.pub")
}
