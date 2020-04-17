output "testing" {
    value = aws_instance.foo.public_ip
    }


output "instance" {
    value = aws_instance.foo.id
    }
