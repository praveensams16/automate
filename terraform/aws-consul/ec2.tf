module "ec2" {
    source = "./module/ec2"
    location = data.aws_ami.ubuntu.id
    subnet = aws_subnet.private.id
    sc = aws_security_group.instance.id
    key = "praveen"
    }


module "ec21" {
    source = "./module/ec2"
    location = data.aws_ami.ubuntu.id
    subnet = aws_subnet.private.id
    key = "praveen"
    sc = aws_security_group.instance.id
    }
