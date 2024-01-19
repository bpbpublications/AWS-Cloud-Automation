# NAT gateway
resource "aws_nat_gateway" "nat-gateway1a" {
  depends_on = [
    aws_subnet.public-subnet-1a,
#	aws_subnet.two-tier-public-subnet-1b,
    aws_eip.elastic-ip1,
  ]
  allocation_id = aws_eip.elastic-ip1.id
  subnet_id     = aws_subnet.public-subnet-1a.id

  tags = {
    Name = "NAT GW"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}

# NAT gateway
resource "aws_nat_gateway" "nat-gateway1b" {
  depends_on = [
#    aws_subnet.two-tier-public-subnet-1a,
        aws_subnet.public-subnet-1b,
    aws_eip.elastic-ip2,
  ]
  allocation_id = aws_eip.elastic-ip2.id
#  subnet_id     = aws_subnet.two-tier-public-subnet-1a.id
  subnet_id     = aws_subnet.public-subnet-1b.id

  tags = {
    Name = "NAT GW"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}
