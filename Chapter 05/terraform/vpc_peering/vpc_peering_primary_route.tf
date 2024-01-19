resource "aws_route" "chapter5-demo-vpc2chapter5-demo-vpcb-route" {
  # ID of VPC 1 main route table.
  route_table_id = "${aws_vpc.chapter5-demo-vpc.main_route_table_id}"

  # CIDR block / IP range for VPC 2.
  destination_cidr_block = "${aws_vpc.chapter5-demo-vpcb.cidr_block}"

  # ID of VPC peering connection.
  vpc_peering_connection_id = "${aws_vpc_peering_connection.chapter5-demo-vpc2chapter5-demo-vpcb.id}"
}
