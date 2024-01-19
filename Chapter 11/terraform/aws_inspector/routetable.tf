# Creating Route Table
resource "aws_route_table" "route" {
    vpc_id = "${aws_vpc.chapter11-inspector-vpcb.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.chapter11-inspector-internet-gateway.id}"
    }

    tags = {
    Name = "James Demo Public Route Table"
	CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}

# Associating Route Table
resource "aws_route_table_association" "chapter11-inspector-public-route1a" {
    subnet_id = "${aws_subnet.three-tier-public-subnet-1a.id}"
    route_table_id = "${aws_route_table.route.id}"
}

# Associating Route Table
resource "aws_route_table_association" "chapter11-inspector-public-route1b" {
    subnet_id = "${aws_subnet.three-tier-public-subnet-1b.id}"
    route_table_id = "${aws_route_table.route.id}"
}
