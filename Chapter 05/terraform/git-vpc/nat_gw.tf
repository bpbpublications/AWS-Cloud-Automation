# Deploying NAT Gateway Elastic IP Address
resource "aws_eip" "nat-gateway-eip" {
  count = local.nat_gateway_count

  vpc  = true
  tags = merge({ "Name" = format("%s-nat-%d", var.name, count.index) }, var.tags)

# Note: EIP may require IGW to exist prior to association. Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.multipurpose-igw]
}

# Note: Deplying NAT Gateway for Publci Subnet
resource "aws_nat_gateway" "nat-gateway" {
  count = local.nat_gateway_count

  allocation_id = aws_eip.nat-gateway-eip.*.id[count.index]
  subnet_id     = aws_subnet.public-subnet.*.id[count.index]
  tags          = merge({ "Name" = format("%s-%d", var.name, count.index) }, var.tags)

# Note: NAT Gateway depends on the Internet Gateway
  depends_on = [aws_internet_gateway.multipurpose-igw]
}

