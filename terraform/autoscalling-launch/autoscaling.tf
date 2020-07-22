###### Autoscaling group

resource "aws_autoscaling_group" "pricebook-catalog-as" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

    launch_template {
        id      = "${aws_launch_template.pricebook-catalog-launch-as.id}"
        version = "$Latest"
    }
}

###### Scaleup

resource "aws_autoscaling_policy" "scaleup" {
  name                   = "scaleup"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.pricebook-catalog-as.name}"
}

resource "aws_cloudwatch_metric_alarm" "scaleup" {
  alarm_name          = "terraform-test-foobar5"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.pricebook-catalog-as.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = ["${aws_autoscaling_policy.scaleup.arn}"]
}

######## Scale Down

resource "aws_autoscaling_policy" "scaledown" {
  name                   = "scaledown"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.pricebook-catalog-as.name}"
}

resource "aws_cloudwatch_metric_alarm" "scaledown" {
  alarm_name          = "scaledown"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.pricebook-catalog-as.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = ["${aws_autoscaling_policy.scaledown.arn}"]
}