module "ec2" {
    source = "./module/ec2"
    instance-type = "t2.micro"
    subnet-id = aws_subnet.web.id 
    region = var.region
   }

output "ips" {
  value=module.ec2.ip
  }


