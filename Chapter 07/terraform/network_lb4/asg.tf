resource "aws_autoscaling_group" "web" {
  name = "${aws_launch_configuration.web.name}-asg"
  min_size             = 2
  desired_capacity     = 2
  max_size             = 10
  
  #health_check_type    = "NLB"
  #load_balancers = [
  #  "${aws_lb.autoscaling-demo-web-elb.id}"
  #]
  load_balancers = [
    "${aws_lb.autoscaling-demo-web-elb.id}"
  ]
launch_configuration = "${aws_launch_configuration.web.name}"
enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
metrics_granularity = "1Minute"
vpc_zone_identifier  = [
    "${aws_subnet.autoscaling-demo-public-subnet.id}",
    "${aws_subnet.autoscaling-demo-public-subnet1.id}"
  ]
# Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }
}
