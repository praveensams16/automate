
resource "aws_instance" "foo" {
  ami           =  var.image
  instance_type = "t2.micro"
  subnet_id = var.subnet
  user_data = <<-EOF
                #!/bin/bash
                yum install httpd -y > sam1 2>&1
                echo "Hello, World" > /var/www/html/index.html
                service httpd restart
                chkconfig httpd on
                id > sam
             EOF
  key_name = var.key
  security_groups = [var.sc]
}
