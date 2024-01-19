# Create Database Security Group
resource "aws_security_group" "private-sg" {
  name        = "Private Subnet SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.general-vpc.id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
  }
  ingress {
    description     = "Allow traffic from application layer"
	from_port       = 22
    to_port         = 22
    protocol        = "tcp"
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}
