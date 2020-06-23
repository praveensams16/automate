resource "aws_ebs_volume" "example" {
  availability_zone = "${var.region}a"
  size   = 40
  count  = var.counts
}
