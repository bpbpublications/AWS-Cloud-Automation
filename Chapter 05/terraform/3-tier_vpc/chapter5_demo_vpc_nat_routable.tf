# route table with target as NAT gateway
resource "aws_route_table" "chapter5-demo-nat-gateway-routetable" {
  depends_on = [
    aws_vpc.chapter5-demo-vpcb,
    aws_nat_gateway.chapter5-demo-nat-gateway1a,
    #aws_nat_gateway.chapter5-demo-nat-gateway1b,
  ]

  vpc_id = aws_vpc.chapter5-demo-vpcb.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.chapter5-demo-nat-gateway1a.id
    #gateway_id = aws_nat_gateway.chapter5-demo-nat-gateway1b.id
  }

  tags = {
    Name = "Chapter5 Demo NAT Gateway Route Table "
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}

# Associate route table to private subnet1a
resource "aws_route_table_association" "associate_routetable_to_private_subnet1a" {
  depends_on = [
    aws_subnet.three-tier-private-subnet-1a,
    aws_route_table.chapter5-demo-nat-gateway-routetable,
  ]
  subnet_id      = aws_subnet.three-tier-private-subnet-1a.id
  route_table_id = aws_route_table.chapter5-demo-nat-gateway-routetable.id
}

# Associate route table to private subnet1b
resource "aws_route_table_association" "associate_routetable_to_private_subnet1b" {
  depends_on = [
    aws_subnet.three-tier-private-subnet-1b,
    aws_route_table.chapter5-demo-nat-gateway-routetable,
  ]
  subnet_id      = aws_subnet.three-tier-private-subnet-1b.id
  route_table_id = aws_route_table.chapter5-demo-nat-gateway-routetable.id
}

# Associate route table to private subnet2a
resource "aws_route_table_association" "associate_routetable_to_private_subnet2a" {
  depends_on = [
    aws_subnet.three-tier-private-subnet-2a,
    aws_route_table.chapter5-demo-nat-gateway-routetable,
  ]
  subnet_id      = aws_subnet.three-tier-private-subnet-2a.id
  route_table_id = aws_route_table.chapter5-demo-nat-gateway-routetable.id
}

# Associate route table to private subnet2b
resource "aws_route_table_association" "associate_routetable_to_private_subnet2b" {
  depends_on = [
    aws_subnet.three-tier-private-subnet-2b,
    aws_route_table.chapter5-demo-nat-gateway-routetable,
  ]
  subnet_id      = aws_subnet.three-tier-private-subnet-2b.id
  route_table_id = aws_route_table.chapter5-demo-nat-gateway-routetable.id
}
