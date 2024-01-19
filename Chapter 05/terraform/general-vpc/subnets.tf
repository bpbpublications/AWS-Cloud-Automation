# Creating 1st web subnet 
resource "aws_subnet" "public-subnet-1a" {
  vpc_id                  = "${aws_vpc.general-vpc.id}"
  cidr_block             = "${var.pub-subnet1a_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Subnet Public1A"
	CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id                  = "${aws_vpc.general-vpc.id}"
  cidr_block             = "${var.pub-subnet1b_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Subnet Public1B"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}


resource "aws_subnet" "private-subnet-1a" {
  vpc_id                  = "${aws_vpc.general-vpc.id}"
  cidr_block             = "${var.pri-subnet1a_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Subnet Private1A"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}

resource "aws_subnet" "private-subnet-1b" {
  vpc_id                  = "${aws_vpc.general-vpc.id}"
  cidr_block             = "${var.pri-subnet1b_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Subnet Private1B"
	CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}


resource "aws_subnet" "private-subnet-2a" {
  vpc_id                  = "${aws_vpc.general-vpc.id}"
  cidr_block             = "${var.pri-subnet2a_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Subnet Private2A"
        CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}

resource "aws_subnet" "private-subnet-2b" {
  vpc_id                  = "${aws_vpc.general-vpc.id}"
  cidr_block             = "${var.pri-subnet2b_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "Subnet Private2B"
        CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}
