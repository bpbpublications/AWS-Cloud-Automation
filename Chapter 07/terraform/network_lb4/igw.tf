resource "aws_internet_gateway" "autoscaling-demo-igw" {
  vpc_id = "${aws_vpc.autoscaling-demo-vpc.id}"
}
