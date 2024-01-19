resource "aws_vpc" "eks-vpc" {
  cidr_block = "10.0.0.0/16"

# This is required for EFS
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name         = "eks-efs"
    CreatedBy    = "James Odeyinka"
    DateCreated  = "03-25-2023"
    Env          = "Demo"
  }
}
