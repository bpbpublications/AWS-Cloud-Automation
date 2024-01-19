resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-east-1a"

  tags = {
    "Name"                                      = "private-us-east-1a-subnet"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    DateCreated                                 = "James Odeyinka"
    CreatedBy                                   = "03-19-2023"
    Env                                         = "Demo"

  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-east-1b"

  tags = {
    "Name"                                      = "private-us-east-1b-subnet"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    DateCreated                                 = "James Odeyinka"
    CreatedBy                                   = "03-19-2023"
    Env                                         = "Demo"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-us-east-1a-subnet"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    DateCreated                                 = "James Odeyinka"
    CreatedBy                                   = "03-19-2023"
    Env                                         = "Demo"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-us-east-1b-subnet"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    DateCreated                                 = "James Odeyinka"
    CreatedBy                                   = "03-19-2023"
    Env                                         = "Demo"
  }
}
