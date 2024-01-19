# Elastic ip
resource "aws_eip" "elastic-ip1" {
  vpc      = true
  tags = {
    Name = "NAT GW EIP1"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}

# Elastic ip
resource "aws_eip" "elastic-ip2" {
  vpc      = true
  tags = {
    Name = "NAT GW EIP2"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}
