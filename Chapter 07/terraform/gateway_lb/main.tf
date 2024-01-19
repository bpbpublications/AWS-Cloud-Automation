resource "aws_vpc" "gwlb-demo-vpc" {
  cidr_block = "10.10.0.0/20"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "Application-1"
  }
}
resource "aws_subnet" "private" {
  count             = length(var.subnet_cidr_private)
  vpc_id            = aws_vpc.gwlb-demo-vpc.id
  cidr_block        = var.subnet_cidr_private[count.index]
  availability_zone = var.availability_zone[count.index]
  tags = {
    "Name" = "Application-1-private"
  }
}
resource "aws_route_table" "gwlb-demo-vpc-rt" {
  vpc_id = aws_vpc.nlb-demo-vpc.id
  tags = {
    "Name" = "Application-1-route-table"
  }
}
resource "aws_route_table_association" "private" {
  count          = length(var.subnet_cidr_private)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.gwlb-demo-vpc-rt.id
}
resource "aws_internet_gateway" "gwlb-demo-vpc-igw" {
  vpc_id = aws_vpc.gwlb-demo-vpc.id
  tags = {
    "Name" = "Application-1-gateway"
  }
}
resource "aws_route" "internet-route" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.gwlb-demo-vpc-rt.id
  gateway_id             = aws_internet_gateway.gwlb-demo-vpc-igw.id
}
