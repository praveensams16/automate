resource "aws_key_pair" "deployer" {
  key_name   = "praveen"
  public_key = file("/root/.ssh/id_rsa.pub")
}
