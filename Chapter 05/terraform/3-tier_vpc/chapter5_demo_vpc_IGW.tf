# Creating Internet Gateway 
resource "aws_internet_gateway" "chapter5-demo-internet-gateway" {
  vpc_id = "${aws_vpc.chapter5-demo-vpcb.id}"
  
  tags = {
    Name = "Chapter5 Demo VPC IGW"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}

