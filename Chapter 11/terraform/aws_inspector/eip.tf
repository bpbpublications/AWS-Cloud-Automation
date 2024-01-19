# Elastic ip
resource "aws_eip" "chapter11-inspector-elastic-ip1" {
  vpc      = true
  tags = {
    Name = "James Demo NAT GW EIP1"
    CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}

# Elastic ip
resource "aws_eip" "chapter11-inspector-elastic-ip2" {
  vpc      = true
  tags = {
    Name = "James Demo NAT GW EIP2"
    CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}
