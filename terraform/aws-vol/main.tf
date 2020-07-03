module "network" {
  source = "./module/network"
  region = var.region
  }

module "internet" {
  source = "./module/internet"
  vpc = module.network.vpc
  }


module "ec1" {
  source = "./module/ec2"
  subnet = module.network.subnet
  data =  var.data
  counts = 1
  region = var.region
  security = module.network.security
}


resource "aws_route_table" "routing" {
  vpc_id = module.network.vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.internet.igw
  }


  tags = {
    Name = "main"
  }
}




resource "aws_route_table_association" "a" {
  subnet_id      = module.network.subnet
  route_table_id = aws_route_table.routing.id
}
