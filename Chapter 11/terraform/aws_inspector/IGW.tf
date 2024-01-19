# Creating Internet Gateway 
resource "aws_internet_gateway" "chapter11-inspector-internet-gateway" {
  vpc_id = "${aws_vpc.chapter11-inspector-vpcb.id}"
  
  tags = {
    Name = "chapter11 inspector Demo VPC IGW"
    CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}

