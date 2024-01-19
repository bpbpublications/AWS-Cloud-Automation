# Creating VPC
resource "aws_vpc" "chapter5-demo-vpc" {
  cidr_block       = "${var.chapter5-demo-vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "Chapter5 Demo VPC"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}
