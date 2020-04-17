resource "aws_elb" "example" {
  name               = "terraform-asg-example"
  #availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  security_groups    = [aws_security_group.instance.id]
  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  # This adds a listener for incoming HTTP requests.
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
  subnets = [aws_subnet.private.id]
  instances = [module.ec2.instance,module.ec21.instance]
}
