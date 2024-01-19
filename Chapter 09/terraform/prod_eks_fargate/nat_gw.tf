resource "aws_eip" "nat-gw-eip" {
  vpc = true

  tags = {
    Name = "NAT GW EIP"
    CreatedBy   = "James Odeyinka"
    DateCreated = "03-23-2023"
    Env         = "Demo"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-gw-eip.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name        = "NAT GW"
    CreatedBy   = "James Odeyinka"
    DateCreated = "03-23-2023"
    Env         = "Demo"
    
  }

  depends_on = [aws_internet_gateway.eks-vpc-igw]
}
