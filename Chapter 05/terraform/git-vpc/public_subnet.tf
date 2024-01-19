# Deploying Public Subnet
resource "aws_subnet" "public-subnet" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.multipurpose-vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.public_availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = merge({ "Name" = format("%s-public-%d", var.name, count.index) }, var.tags)
}
