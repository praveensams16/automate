module "ec2" {
    source = "./module/ec2"
    subnet = aws_subnet.cloudra.id
    security =  ["${aws_security_group.cloudra.id}"]
    }

module "ec1" {
    source = "./module/ec2"
    subnet = aws_subnet.cloudra.id
    security =  ["${aws_security_group.cloudra.id}"]
    }

