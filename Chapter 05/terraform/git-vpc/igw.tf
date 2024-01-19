# Deploying the Internet Gateway
resource "aws_internet_gateway" "multipurpose-igw" {
  vpc_id = aws_vpc.multipurpose-vpc.id
  tags   = merge({ "Name" = var.name }, var.tags)
}
