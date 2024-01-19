# Creating 1st web subnet 
resource "aws_subnet" "three-tier-public-subnet-1a" {
  vpc_id                  = "${aws_vpc.chapter11-inspector-vpcb.id}"
  cidr_block             = "${var.pub-subnet1a_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Demo Subnet Public1A"
	CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}

resource "aws_subnet" "three-tier-public-subnet-1b" {
  vpc_id                  = "${aws_vpc.chapter11-inspector-vpcb.id}"
  cidr_block             = "${var.pub-subnet1b_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Demo Subnet Public1B"
    CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}


resource "aws_subnet" "three-tier-private-subnet-1a" {
  vpc_id                  = "${aws_vpc.chapter11-inspector-vpcb.id}"
  cidr_block             = "${var.pri-subnet1a_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Demo Subnet Private1A"
	CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}

resource "aws_subnet" "three-tier-private-subnet-1b" {
  vpc_id                  = "${aws_vpc.chapter11-inspector-vpcb.id}"
  cidr_block             = "${var.pri-subnet1b_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Demo Subnet Private1B"
	CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}


resource "aws_subnet" "three-tier-private-subnet-2a" {
  vpc_id                  = "${aws_vpc.chapter11-inspector-vpcb.id}"
  cidr_block             = "${var.pri-subnet2a_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Demo Subnet Private2A"
        CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}

resource "aws_subnet" "three-tier-private-subnet-2b" {
  vpc_id                  = "${aws_vpc.chapter11-inspector-vpcb.id}"
  cidr_block             = "${var.pri-subnet1b_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Demo Subnet Private2B"
        CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
    Env = "Demo"
  }
}
