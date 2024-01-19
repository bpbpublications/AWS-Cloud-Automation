# Create a Gateway Load Balancer
resource "aws_lb" "example" {
    name               = "gateway-lb"
    internal           = false
    load_balancer_type = "gateway"
    subnets            = [for subnet in aws_subnet.private : subnet.id]
    security_groups    = [aws_security_group.gateway-lb.id]
    tags = {
        Environment = "Demo"
    }
}

