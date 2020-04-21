resource "aws_instance" "foo" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.local.id
   key_name = aws_key_pair.deployer.id
   security_groups = [aws_security_group.sc.id]
   user_data = <<-EOF
                #! /bin/bash
                sudo yum install git -y
                sudo yum install ansible -y > /tmp/logs
                curl -s https://raw.githubusercontent.com/praveensams/docker-ansible/master/plays | sudo bash | tee -a /tmp/logs
                cd /mnt/
                git clone https://github.com/praveensams/automate.git
                cd chart/build/mediawiki
                sudo docker-compose build | tee -a /tmp/logs
                sudo docker-compose up -d | tee -a /tmp/logs
                EOF

}
