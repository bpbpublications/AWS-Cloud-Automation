# Deploying Private Subnet
resource "aws_subnet" "private-subnet" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.multipurpose-vpc.id
  cidr_block              = var.private_subnet_cidr_blocks[count.index]
  availability_zone       = var.private_availability_zones[count.index]
  map_public_ip_on_launch = false
  tags                    = merge({ "Name" = format("%s-private-%d", var.name, count.index) }, var.tags)
}
