# NAT gateway
resource "aws_nat_gateway" "chapter5-demo-nat-gateway1a" {
  depends_on = [
    aws_subnet.three-tier-public-subnet-1a,
#	aws_subnet.two-tier-public-subnet-1b,
    aws_eip.chapter5-demo-elastic-ip1,
  ]
  allocation_id = aws_eip.chapter5-demo-elastic-ip1.id
  subnet_id     = aws_subnet.three-tier-public-subnet-1a.id

  tags = {
    Name = "James Demo NAT GW"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}

# NAT gateway
resource "aws_nat_gateway" "chapter5-demo-nat-gateway1b" {
  depends_on = [
#    aws_subnet.two-tier-public-subnet-1a,
        aws_subnet.three-tier-public-subnet-1b,
    aws_eip.chapter5-demo-elastic-ip2,
  ]
  allocation_id = aws_eip.chapter5-demo-elastic-ip2.id
#  subnet_id     = aws_subnet.two-tier-public-subnet-1a.id
  subnet_id     = aws_subnet.three-tier-public-subnet-1b.id

  tags = {
    Name = "James Demo NAT GW"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}
