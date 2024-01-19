# Creating network.tf
resource "aws_vpc" "efs-demo-vpc" {
   cidr_block = "10.10.0.0/23"
   enable_dns_hostnames = true
   enable_dns_support = true
   
   tags = {
     Name        = "efs-demo-vpc"
     CreatedBy   = "James Odeyinka"
     DateCreated = "02-25-2023"
     Env         = "Demo"
   }
 }
 
# Creating subnets for efs and ec2 
resource "aws_subnet" "efs-demo-subnet"{
  vpc_id = "${aws_vpc.efs-demo-vpc.id}"
  cidr_block = "10.10.0.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = "true"
 tags = {
     Name        = "efs-demo-subnet"
     CreatedBy   = "James Odeyinka"
     DateCreated = "02-25-2023"
     Env         = "Demo"
   }
}

resource "aws_subnet" "ec2-demo-subnet" {
  vpc_id = "${aws_vpc.efs-demo-vpc.id}"
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-2b"
 tags = {
     Name        = "ec2-demo-subnet"
     CreatedBy   = "James Odeyinka"
     DateCreated = "02-25-2023"
     Env         = "Demo"
   }
}


# resource "aws_subnet" "subnet-efs" {
#   cidr_block = "${cidrsubnet(aws_vpc.efs-demo-vpc.cidr_block, 8, 8)}"
#   vpc_id = "${aws_vpc.efs-demo-vpc.id}"
#   availability_zone = "us-east-2b"
# }

#resource "aws_subnet" "subnet-ec2" {
#   cidr_block = "${cidrsubnet(aws_vpc.efs-demo-vpc.cidr_block, 8, 8)}"
#   vpc_id = "${aws_vpc.efs-demo-vpc.id}"
#   availability_zone = "us-east-2b"
# }
