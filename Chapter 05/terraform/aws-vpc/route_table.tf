# Creating Route Table
resource "aws_route_table" "route" {
    vpc_id = "${aws_vpc.general-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.internet-gateway.id}"
    }

    tags = {
    Name = "Public Route Table"
	CreatedBy = "James Odeyinka",
    DateCreated = "03-26-2023",
    Environment = "Open Source"
  }
}

# Associating Route Table
resource "aws_route_table_association" "public-route1a" {
    subnet_id = "${aws_subnet.public-subnet-1a.id}"
    route_table_id = "${aws_route_table.route.id}"
}

# Associating Route Table
resource "aws_route_table_association" "public-route1b" {
    subnet_id = "${aws_subnet.public-subnet-1b.id}"
    route_table_id = "${aws_route_table.route.id}"
}
