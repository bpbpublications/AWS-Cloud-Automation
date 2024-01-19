# Creating VPC
resource "aws_vpc" "chapter11-inspector-vpcb" {
  cidr_block       = "${var.chapter11-inspector-vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "Chapter11 Inspector VPC"
    CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}
