resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  count = var.counts
  volume_id   = "${aws_ebs_volume.example[count.index].id}"
  instance_id = "${aws_instance.foo[count.index].id}"
}

