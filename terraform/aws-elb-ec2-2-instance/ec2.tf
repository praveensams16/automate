module "ec2" {
    source = "./module/ec2"
    image = var.image[var.region]
    sc = aws_security_group.local.id
    key = aws_key_pair.deployer.id
    subnet = aws_subnet.public.id
    }


module "ec21" {
    source = "./module/ec2"
    image = var.image[var.region]
    sc = aws_security_group.local.id
    key = aws_key_pair.deployer.id
    subnet = aws_subnet.public.id
    }

