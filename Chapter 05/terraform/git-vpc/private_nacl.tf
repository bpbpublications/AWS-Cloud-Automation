# Deploying Network Access Control List
resource "aws_network_acl" "private-nacl" {
  vpc_id     = aws_vpc.multipurpose-vpc.id
  subnet_ids = aws_subnet.private-subnet.*.id
  tags       = merge({ "Name" = format("%s-private", var.name) }, var.tags)
}

# Inbound Traffic Rule
resource "aws_network_acl_rule" "private_ingress" {
  network_acl_id = aws_network_acl.private.id
  egress         = false
  from_port      = 0
  to_port        = 0
  rule_number    = 100
  rule_action    = "allow"
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

# Outbound Traffic Rule
resource "aws_network_acl_rule" "private_egress" {
  network_acl_id = aws_network_acl.private.id
  egress         = true
  from_port      = 0
  to_port        = 0
  rule_number    = 100
  rule_action    = "allow"
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

locals {
  nat_gateway_count = var.enabled_nat_gateway ? var.enabled_single_nat_gateway ? 1 : length(var.private_subnet_cidr_blocks) : 0
}

