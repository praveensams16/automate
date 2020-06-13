resource "aws_key_pair" "eks-test" {
  key_name   = "eks-test"
  public_key = file("/root/.ssh/id_rsa.pub")
}
