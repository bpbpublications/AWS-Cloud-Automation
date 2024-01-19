resource "aws_lb_target_group" "front" {
  name     = "application-front"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.alb-demo-vpc.id
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 3
    unhealthy_threshold = 2
  }
}
# Attaching the lb_target_group to the load balancer
resource "aws_lb_target_group_attachment" "attach-app1" {
  count            = length(aws_instance.app-server)
  target_group_arn = aws_lb_target_group.front.arn
  target_id        = element(aws_instance.app-server.*.id, count.index)
  port             = 80
}
# This is the load balancer listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front.arn
  }
}
# Creating the lb
resource "aws_lb" "front" {
  name               = "front"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http-sg.id]
  subnets            = [for subnet in aws_subnet.private : subnet.id]

  enable_deletion_protection = false

  tags = {
    Environment = "front"
  }
}
