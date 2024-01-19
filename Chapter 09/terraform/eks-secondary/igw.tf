resource "aws_internet_gateway" "eks-vpc-igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name          = "EKS VPC IGW"
    CreatedBy     = "James Odeyinka"
    DateCreated   = "03-19-2023"
    Env           = "Demo"
  }
}

