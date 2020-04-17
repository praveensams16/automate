output "instance" {
    value = aws_instance.foo.id
    }




output "ips" {
  value = [aws_instance.foo.public_ip]
}
