module "ec2" {
    source="./modules/ec2"
    region=var.region
    instance-type="t2.micro"
    subnet=aws_subnet.web.id
    }

module "ec21" {
    source="./modules/ec2"
    region=var.region
    instance-type="t2.micro"
    subnet=aws_subnet.web.id
    }
