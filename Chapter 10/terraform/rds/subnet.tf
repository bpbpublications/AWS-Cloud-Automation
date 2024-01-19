# query the AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# create 2 subnets
resource "aws_subnet" "demo-rdsdb-subnet" {
  count             = 2
  vpc_id            = aws_vpc.demo-rds-db-vpc.id
  cidr_block        = cidrsubnet(aws_vpc.demo-rds-db-vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
}

# allow data flow between the components
resource "aws_security_group" "demo-rdsdb-sg" {
  vpc_id = aws_vpc.demo-rds-db-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.demo-rds-db-vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.demo-rds-db-vpc.cidr_block]
  }
}
