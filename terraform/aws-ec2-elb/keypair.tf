resource "aws_key_pair" "deployer" {
  key_name   = "praveen1"
  public_key = file("/root/.ssh/id_rsa.pub")
}
