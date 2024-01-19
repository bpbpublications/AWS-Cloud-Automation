# Creating Security Group 
resource "aws_security_group" "chapter5-demo-public-sg" {
  name        = "Public Subnet SG"
  vpc_id = "${aws_vpc.chapter5-demo-vpcb.id}"

  # Inbound Rules
  # HTTP access from James House
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["69.47.200.180/32"]
  }

  # HTTPS access from James House
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["69.47.200.180/32"]
  }
  
  # GoPhish Port access from James House
  ingress {
    from_port   = 3333
    to_port     = 3333
    protocol    = "tcp"
    cidr_blocks = ["69.47.200.180/32"]
  }

  # SSH access from James House
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["69.47.200.180/32"]
  }

  # Outbound Rules
  # Internet access to James House
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}
