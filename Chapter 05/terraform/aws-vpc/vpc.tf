# Creating VPC
resource "aws_vpc" "general-vpc" {
  cidr_block       = "${var.general-vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "General VPC"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Environment = "Open Source"
  }
}
