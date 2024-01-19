# Creating routing table
resource "aws_route_table" "efs-demo-route-table" {
  vpc_id = "${aws_vpc.efs-demo-vpc.id}"
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.efs-demo-igw.id}"
  }
  tags = {
   Name = "efs-demo-route"
   CreatedBy = "James Odeyinka"
   DateCreated = "02-25-2023"
   Env = "Demo"
  }
}
resource "aws_route_table_association" "efs-demo-route-a" {
  subnet_id      = aws_subnet.efs-demo-subnet.id
  route_table_id = aws_route_table.efs-demo-route-table.id
}
resource "aws_route_table_association" "ec2-demo-route-b" {
  subnet_id      = aws_subnet.ec2-demo-subnet.id
  route_table_id = aws_route_table.efs-demo-route-table.id
}
