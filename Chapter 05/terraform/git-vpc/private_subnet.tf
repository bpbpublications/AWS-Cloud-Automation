# Deploying Private Subnet
resource "aws_route_table" "private-route-table" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id = aws_vpc.multipurpose-vpc.id
  tags   = merge({ "Name" = format("%s-private-%d", var.name, count.index) }, var.tags)
}

# Deloying Route
resource "aws_route" "private-route" {
  count = var.enabled_nat_gateway ? length(var.private_subnet_cidr_blocks) : 0

  route_table_id         = aws_route_table.private-route-table.*.id[count.index]
  nat_gateway_id         = var.enabled_single_nat_gateway ? aws_nat_gateway.nat-gateway.*.id[0] : aws_nat_gateway.nat-gateway.*.id[count.index]
  destination_cidr_block = "0.0.0.0/0"
}

# Public Route Table Association
resource "aws_route_table_association" "private-route-association" {
  count = length(var.private_subnet_cidr_blocks)

  subnet_id      = aws_subnet.private-subnet.*.id[count.index]
  route_table_id = aws_route_table.private-subnet.*.id[count.index]
}
