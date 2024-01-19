# Deploying Route Table for Public Subnets
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.multipurpose-vpc.id
  tags   = merge({ "Name" = format("%s-public", var.name) }, var.tags)
}

# Deploying Public Route
resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.multipurpose-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "public-route-association" {
  count = length(var.public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.public-subnet.*.id[count.index]
  route_table_id = aws_route_table.public-route-table.id
}
