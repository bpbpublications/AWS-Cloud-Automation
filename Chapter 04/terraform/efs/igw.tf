// creating internet gateway
resource "aws_internet_gateway" "efs-demo-igw" {
  vpc_id = "${aws_vpc.efs-demo-vpc.id}"

  tags = {
    Name = "efs-demo-igw"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}
