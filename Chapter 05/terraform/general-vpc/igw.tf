# Creating Internet Gateway 
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = "${aws_vpc.general-vpc.id}"
  
  tags = {
    Name = "VPC IGW"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}

