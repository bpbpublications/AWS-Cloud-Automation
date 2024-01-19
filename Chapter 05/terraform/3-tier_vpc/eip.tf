# Elastic ip
resource "aws_eip" "chapter5-demo-elastic-ip1" {
  vpc      = true
  tags = {
    Name = "James Demo NAT GW EIP1"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}

# Elastic ip
resource "aws_eip" "chapter5-demo-elastic-ip2" {
  vpc      = true
  tags = {
    Name = "James Demo NAT GW EIP2"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}
