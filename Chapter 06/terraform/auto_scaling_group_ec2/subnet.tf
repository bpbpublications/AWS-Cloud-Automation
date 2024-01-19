# Creating public subnet 
resource "aws_subnet" "autoscaling-demo-public-subnet" {
  vpc_id                  = "${aws_vpc.autoscaling-demo-vpc.id}"
  cidr_block             = "${var.subnet_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
tags = {
    Name = "Autoscaling Demo Public Subnet"
  }
}
# Creating Public subnet 1 
resource "aws_subnet" "autoscaling-demo-public-subnet1" {
  vpc_id                  = "${aws_vpc.autoscaling-demo-vpc.id}"
  cidr_block             = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
tags = {
    Name = "Autoscaling Demo Public Subnet 1"
  }
}
