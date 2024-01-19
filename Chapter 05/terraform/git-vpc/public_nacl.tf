# Deploying Network Access Control List
resource "aws_network_acl" "public-subnet-nacl" {
  vpc_id     = aws_vpc.multipurpose-vpc.id
  subnet_ids = aws_subnet.public-subnet.*.id
  tags       = merge({ "Name" = format("%s-public", var.name) }, var.tags)
}

# Deploying Ingress Rule for Public NACL
resource "aws_network_acl_rule" "public_ingress" {
  network_acl_id = aws_network_acl.public.id
  egress         = false
  from_port      = 0
  to_port        = 0
  rule_number    = 100
  rule_action    = "allow"
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "public_egress" {
  network_acl_id = aws_network_acl.public.id
  egress         = true
  from_port      = 0
  to_port        = 0
  rule_number    = 100
  rule_action    = "allow"
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}
