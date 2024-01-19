# create VPC Network access control list
resource "aws_network_acl" "chapter11-inspector-vpc-nacl" {
  vpc_id = aws_vpc.chapter11-inspector-vpcb.id
  subnet_ids = [ aws_subnet.three-tier-public-subnet-1a.id, aws_subnet.three-tier-public-subnet-1b.id, aws_subnet.three-tier-private-subnet-1a.id, aws_subnet.three-tier-private-subnet-1b.id, aws_subnet.three-tier-private-subnet-2a.id,aws_subnet.three-tier-private-subnet-2b.id ]# allow ingress port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock 
    from_port  = 22
    to_port    = 22
  }
  
  # allow ingress port 80 
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock 
    from_port  = 80
    to_port    = 80
  }
  
  # allow ingress ephemeral ports 
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }
  
  # allow egress port 22 
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 22 
    to_port    = 22
  }
  
  # allow egress port 80 
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 80  
    to_port    = 80 
  }
 
  # allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }
  
  tags = {
    Name = "Chapter5 Demo VPC NACL"
    CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
}
}
