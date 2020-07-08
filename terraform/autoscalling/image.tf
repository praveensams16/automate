data "aws_instance" "sam" {
  instance_tags = {
    Name = "praveen"
    }
    }

resource "aws_ami_from_instance" "example" {
  name               = "terraform-example"
  source_instance_id = data.aws_instance.sam.id
  }

output "result" {
  value = aws_ami_from_instance.example.id
  }



resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      =  aws_ami_from_instance.example.id
  instance_type = "t2.micro"
  lifecycle {
          create_before_destroy = true
              }
}


resource "aws_autoscaling_group" "bar" {
  name                      = "foobar3-terraform-test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  vpc_zone_identifier       = [aws_subnet.local.id]

  initial_lifecycle_hook {
    name                 = "foobar"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2000
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

    notification_metadata = <<EOF
{
  "foo": "bar"
}
EOF

    notification_target_arn = aws_sns_topic.sns.id
    role_arn                = aws_iam_role.test_role.arn
  }

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}

resource "aws_sns_topic" "sns" {
  name = "user-updates-topic"
}


