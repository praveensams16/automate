module "ec2" {
    source = "./module/ec2"
    subnet = aws_subnet.cloudra.id
    security =  ["${aws_security_group.cloudra.id}"]
    region = var.region
    }

module "ec1" {
    source = "./module/ec2"
    subnet = aws_subnet.cloudra.id
    security =  ["${aws_security_group.cloudra.id}"]
    region = var.region
    }

