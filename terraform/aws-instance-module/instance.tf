module "ec2" {
    source = "./module/ec2"
    instance-type = "t2.micro"
    subnet-id = aws_subnet.web.id 
    region = var.region
   }

module "ec21" {
    source = "./module/ec2"
    instance-type = "t2.micro"
    subnet-id = aws_subnet.web.id 
    region = var.region
   }


module "ec31" {
    source = "./module/ec2"
    instance-type = "t2.micro"
    subnet-id = aws_subnet.web.id 
    region = var.region
   }
