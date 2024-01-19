resource "aws_vpc" "autoscaling-demo-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
tags = {
    Name = "Auto Scaling Demo VPC"
  }
}
