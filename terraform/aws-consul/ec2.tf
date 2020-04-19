module "ec2" {
    source = "./module/ec2"
    location = var.images
    subnet = aws_subnet.private.id
    sc = aws_security_group.instance.id
    key = "praveen"
    }


module "ec21" {
    source = "./module/ec2"
    location = var.images
    subnet = aws_subnet.private.id
    key = "praveen"
    sc = aws_security_group.instance.id
    }
