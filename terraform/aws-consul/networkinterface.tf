resource "aws_network_interface" "interface" {
  subnet_id   = aws_subnet.private.id
  tags = {
    Name = "primary_network_interface"
  }
}
