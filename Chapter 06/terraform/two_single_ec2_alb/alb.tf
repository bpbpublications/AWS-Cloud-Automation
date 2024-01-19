# Create target group
resource "aws_lb_target_group" "route53-demo-alb-target-group" {
  name     = "Route53 Demo ALB Target Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
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
# Attach the EC2 to the Load Balancer
resource "aws_lb_target_group_attachment" "attach-app1" {
  #count            = length(aws_instance.app-server)
   count           = length(aws_instance.ec2_public)
  target_group_arn = aws_lb_target_group.route53-demo-alb.arn
  #target_id        = element(aws_instance.app-server.*.id, count.index)
  target_id        = element(aws_instance.ec2_public.*.id, count.index)
  port             = 80
}
# Create the Load Balancer Listener
resource "aws_lb_listener" "route53-demo-alb-listener" {
  load_balancer_arn = aws_lb.route53-demo-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.route53-demo-alb.arn
  }
}
# Create the Load Balancer
resource "aws_lb" "route53-demo-alb" {
  name               = "Route53 Demo ALB"
  internal           = false
  load_balancer_type = "application"
  #security_groups    = [aws_security_group.allow_ssh_pub.id]
   security_gtroups  = [var.sg_pub_id]
  #subnets            = [for subnet in aws_subnet.private : subnet.id]
  subnet_id          = var.vpc.public_subnets[0]

  enable_deletion_protection = false

  tags = {
    CreatedBy   = "James Odeyinka"
    DateCreated = "03-17-2023"
    Environment = "Demo"
  }
}
