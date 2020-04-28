resource "aws_route_table_association" "cloudra" {
  subnet_id      = aws_subnet.cloudra.id
  route_table_id = aws_route_table.cloudra.id
}
