variable "region" {

    default = "us-east-2"

}

data "aws_availability_zones" "available" {}


locals {

    cluster_name = "eks-demo-cluster"

}


module vpc {

    source = "terraform-aws-modules/vpc/aws"
    version = "3.2.0"
    name = "eks-demo-vpc"
    cidr = "10.10.0.0/20"
    azs = data.aws_availability_zones.available.names
    private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
    public_subnets =  ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true


tags = {

    "Name"      = "EKS-VPC"
    CreatedBy   = "James Odeyinka"
    DateCreated = "03-19-2023"
    Env         = "Demo"
}

public_subnet_tags = {

    "Name"      = "EKS Demo Public Subnet"
    CreatedBy   = "James Odeyinka"
    DateCreated = "03-19-2023"
    Env         = "Demo"

}

private_subnet_tags = {

    "Name" = "EKS Demo Private Subnet"
    CreatedBy   = "James Odeyinka"
    DateCreated = "03-19-2023"
    Env         = "Demo"

}

}
