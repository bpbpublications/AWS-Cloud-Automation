# ALB for the web servers
resource "aws_lb" "autoscaling-demo-web-elb" {
  name               = "demo-web-nlb"
  internal           = false
  load_balancer_type = "network"
  #security_groups = [
  #  "${aws_security_group.autoscaling-elb-demo-sg1.id}"
  #]
  subnets = [
    "${aws_subnet.autoscaling-demo-public-subnet.id}",
    "${aws_subnet.autoscaling-demo-public-subnet1.id}"
  ]
  enable_cross_zone_load_balancing = true
  enable_http2       = false
  enable_deletion_protection = false

  tags = {
    Name = "demo-web-nlb"
    CreatedBy = "James Odeyinka"
    DateCreated = "03/12/2023"
  }
}
