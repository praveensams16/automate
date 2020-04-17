resource "aws_instance" "foo" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.local.id
   key_name = aws_key_pair.deployer.id
   security_groups = [aws_security_group.sc.id]
   user_data = <<-EOF
                #! /bin/bash
                uname -a > /tmp/sam
                yum install git -y
                yum install ansible -y > /tmp/logs
                ansible-pull -i localhost -U  https://praveensams16%40gmail.com:Pe%40rson%40123@github.com/praveensams/seera-testing.git terraform/aws-userdata/deployer.yml >> /tmp/logs
                EOF

}
