module "network" {
  source = "./module/network"
  }

module "internet" {
  source = "./module/internet"
  vpc = module.network.vpc
  }

resource "aws_instance" "foo" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  subnet_id =  module.network.subnet
  user_data = var.data
  associate_public_ip_address = true
  key_name = "deployer-key1"
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

