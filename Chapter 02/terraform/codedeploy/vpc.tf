# 1. Create VPC
resource "aws_vpc" "vpc_awsca_demo" {
  cidr_block       = "10.10.8.0/22"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_awsca_demo"
  }
}

# 2. Create Internet Gateway
resource "aws_internet_gateway" "igw_awsca_demo" {
  vpc_id = aws_vpc.vpc_awsca_demo.id

  tags = {
    "Name" = "igw_awsca_demo"
  }
}

# 3. Create custom public and private Router table
resource "aws_route_table" "rt_public_demo" {
  vpc_id = aws_vpc.vpc_awsca_demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_awsca_demo.id
  }

  tags = {
    "Name" = "rt_public_demo"
  }
}

resource "aws_route_table" "rt_private_demo" {
  vpc_id = aws_vpc.vpc_awsca_demo.id

  tags = {
    "Name" = "rt_private_demo"
  }
}

# 4. Create subnet
resource "aws_subnet" "subnet_public_1a_demo" {
  vpc_id     = aws_vpc.vpc_awsca_demo.id
  availability_zone = "us-east-2a"
  cidr_block = "10.10.8.0/25"

  tags = {
    Name = "subnet_public_1a_demo"
  }
}

resource "aws_subnet" "subnet_public_1b_demo" {
  vpc_id     = aws_vpc.vpc_awsca_demo.id
  availability_zone = "us-east-2a"
  cidr_block = "10.10.8.128/25"

  tags = {
    Name = "subnet_public_1b_demo"
  }
}

resource "aws_subnet" "subnet_private_1a_demo" {
  vpc_id     = aws_vpc.vpc_awsca_demo.id
  availability_zone = "us-east-2a"
  cidr_block = "10.10.9.0/25"

  tags = {
    Name = "subnet_private_1a_demo"
  }
}

resource "aws_subnet" "subnet_private_1b_demo" {
  vpc_id     = aws_vpc.vpc_awsca_demo.id
  availability_zone = "us-east-2a"
  cidr_block = "10.10.9.128/25"

  tags = {
    Name = "subnet_private_1b_demo"
  }
}

# 5.Associate subnet with Route table
resource "aws_route_table_association" "aws_route_table_association_public_1a_demo" {
  subnet_id      = aws_subnet.subnet_public_1a_demo.id
  route_table_id = aws_route_table.rt_public_demo.id
}

resource "aws_route_table_association" "aws_route_table_association_public_1b_demo" {
  subnet_id      = aws_subnet.subnet_public_1b_demo.id
  route_table_id = aws_route_table.rt_public_demo.id
}

resource "aws_route_table_association" "aws_route_table_association_private__1a_demo" {
  subnet_id      = aws_subnet.subnet_private_1a_demo.id
  route_table_id = aws_route_table.rt_private_demo.id
}

resource "aws_route_table_association" "aws_route_table_association_private__1b_demo" {
  subnet_id      = aws_subnet.subnet_private_1b_demo.id
  route_table_id = aws_route_table.rt_private_demo.id
}
