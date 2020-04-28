resource "aws_volume_attachment" "cloudra" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.cloudra.id
  instance_id = aws_instance.cloudra.id
}
