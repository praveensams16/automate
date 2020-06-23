variable "data" {
     default =  <<-EOF
                #! /bin/bash
                uname -a > /tmp/sam
                yum install git -y
                yum install ansible -y > /tmp/logs
                yum install ansible -y
                ansible-pull -i localhost -U  https://praveensams16%40gmail.com:Pe%40rson%40123@github.com/praveensams/seera-testing.git terraform/aws-userdata/deployer.yml >> /tmp/logs
                EOF
  }


variable "region" {
  default = "us-east-1"
  }
