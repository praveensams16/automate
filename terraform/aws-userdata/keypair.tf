resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key1"
  public_key = file("/root/.ssh/id_rsa.pub")
}
