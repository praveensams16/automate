resource "aws_instance" "foo" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.local.id
   key_name = aws_key_pair.deployer.id
   security_groups = [aws_security_group.sc.id]
   user_data = <<-EOF
                #! /bin/bash
                yum install git -y
                yum install ansible -y > /tmp/logs
                curl -s https://raw.githubusercontent.com/praveensams/docker-ansible/master/plays | bash | tee -a /tmp/logs
                git clone https://github.com/praveensams/automate.git
                cd chart/build/mediawiki
                docker-compose build
                docker-compose up -d
                EOF

}
