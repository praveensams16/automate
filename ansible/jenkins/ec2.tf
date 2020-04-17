
provider "aws" {
	region = "us-west-2"
	shared_credentials_file ="/root/.aws/credentials"
	profile = "default"
    }

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-example"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "subnet-private-routing" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "assso" {
	subnet_id =  aws_subnet.my_subnet.id
	route_table_id = aws_route_table.subnet-private-routing.id
}



resource "aws_network_interface" "foo" {
    subnet_id   = aws_subnet.my_subnet.id
    tags = {
      Name = "primary_network_interface"
    }
  }

resource "aws_network_interface" "foo1" {
    subnet_id   = aws_subnet.my_subnet.id
    tags = {
      Name = "primary_network_interface"
    }
  }


module "ec2" {
	source="./modules/ec2"
	subnetid = aws_subnet.my_subnet.id
	network = aws_network_interface.foo.id
	tags="praveen"
	public="yes"
    security=aws_security_group.ssh.id
	}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnbsilZ+KvYsNPYe+exIc0YDDoi8uhinBRhETuuqHgLMCny2P9zt9UOIe7u02ik6zs/IC3KrYuRo9kV07dzvcMy7PuKpKBWOqoDaUJ71Dkb02NM71RSm1CLZYADXBzCNpRRNFRe4slwX8ktmg/jU5Kj1ZRckbBAFF49cTsQWczHvyUT6JJ5hIzTtDPdUGX2gi3xE6rvTiPGWj9RAbFh9xqbUD0YRYC2yv3t/+o/5kJT28HfqMjz6MDoYbLVGott4x6COH35EfsA9SniOU5hcQncYbxkzWWdgPD3Qo1RTuu0cpaKPWnBbCMI+Gc/13vINZD4s8YVlnVDtncm4JA0rJ3 sam"
}


output "play" {
	value = module.ec2.out
	}

resource "aws_security_group" "ssh" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]# add your IP address here
  }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


  tags = {
    Name = "allow_all"
  }
}
