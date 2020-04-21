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
                ansible-pull -i localhost -U  https://github.com/praveensams/automate.git terraform/mediawiki/docker.yml   | tee -a /tmp/logs
                ansible-pull -i localhost -U  https://github.com/praveensams/automate.git terraform/mediawiki/deployer.yml   | tee -a /tmp/logs
                EOF

}
