# VPC Deployed Information
output "vpc_arn" {
  value       = aws_vpc.multipurpose-vpc.arn
  description = "Amazon Resource Name (ARN) of VPC."
}

output "vpc_id" {
  value       = aws_vpc.multipurpose-vpc.id
  description = "The ID of the VPC."
}

output "vpc_cidr_block" {
  value       = aws_vpc.multipurpose-vpc.cidr_block
  description = "The CIDR block of the VPC."
}

output "vpc_instance_tenancy" {
  value       = aws_vpc.multipurpose-vpc.instance_tenancy
  description = "Tenancy of instances spin up within VPC."
}

output "vpc_enable_dns_support" {
  value       = aws_vpc.multipurpose-vpc.enable_dns_support
  description = "Does VPC has DNS support or not."
}

output "vpc_enable_dns_hostnames" {
  value       = aws_vpc.multipurpose-vpc.enable_dns_hostnames
  description = "Whether or not the VPC has DNS hostname support."
}

output "vpc_main_route_table_id" {
  value       = aws_vpc.multipurpose-vpc.main_route_table_id
  description = "The ID of the main route table associated with this VPC."
}

output "vpc_default_network_acl_id" {
  value       = aws_vpc.multipurpose-vpc.default_network_acl_id
  description = "The ID of the network ACL created by default on VPC creation."
}

output "vpc_default_security_group_id" {
  value       = aws_vpc.multipurpose-vpc.default_security_group_id
  description = "The ID of the security group created by default on VPC creation."
}

output "vpc_default_route_table_id" {
  value       = aws_vpc.multipurpose-vpc.default_route_table_id
  description = "The ID of the route table created by default on VPC creation."
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.multipurpose-igw.id
  description = "The ID of the Internet Gateway."
}

output "public_subnet_ids" {
  value       = aws_subnet.public-subnet.*.id
  description = "The IDs of the public subnets."
}

output "public_subnet_arns" {
  value       = aws_subnet.public-subnet.*.arn
  description = "The ARNs of the public subnets."
}

output "public_subnet_cidr_blocks" {
  value       = aws_subnet.public-subnet.*.cidr_block
  description = "The CIDR blocks for the public subnets."
}

output "public_subnet_availability_zones" {
  value       = aws_subnet.public-subnet.*.availability_zone
  description = "The Availability Zones for the public subnets."
}

output "public_route_table_id" {
  value       = aws_route_table.public-route-table.id
  description = "The ID of the public routing table."
}

output "public_route_table_association_ids" {
  value       = aws_route_table_association.public-route-association.*.id
  description = "The IDs of the public associations."
}

output "public_network_acl_id" {
  value       = aws_network_acl.public-subnet-nacl.id
  description = "The ID of the public network ACL."
}

output "public_ingress_network_acl_rule_id" {
  value       = aws_network_acl_rule.public_ingress.id
  description = "The ID of the public ingress network ACL Rule."
}

output "public_egress_network_acl_rule_id" {
  value       = aws_network_acl_rule.public_egress.id
  description = "The ID of the public egress network ACL Rule."
}

output "private_subnet_ids" {
  value       = aws_subnet.private-subnet.*.id
  description = "The IDs of the private subnets."
}

output "private_subnet_arns" {
  value       = aws_subnet.private-subnet.*.arn
  description = "The ARNs of the private subnets."
}

output "private_subnet_cidr_blocks" {
  value       = aws_subnet.private-subnet.*.cidr_block
  description = "The CIDR blocks for the private subnets."
}

output "private_subnet_availability_zones" {
  value       = aws_subnet.private-subnet.*.availability_zone
  description = "The Availability Zones for the private subnets."
}


output "eip_nat_gateway_ids" {
  value       = aws_eip.nat-gateway-eip.*.id
  description = "Contains the EIP allocation IDs."
}

output "eip_nat_gateway_private_ips" {
  value       = aws_eip.nat-gateway-eip.*.private_ip
  description = "Contains the private IP addresses (if in VPC)."
}

output "eip_nat_gateway_public_ips" {
  value       = aws_eip.nat-gateway-eip.*.public_ip
  description = "Contains the public IP addresses."
}

output "nat_gateway_ids" {
  value       = aws_nat-gateway.nat-gateway.*.id
  description = "The IDs of the NAT Gateways."
}

output "nat_gateway_allocation_ids" {
  value       = aws_nat_gateway.nat-gateway.*.allocation_id
  description = "The Allocation IDs of the Elastic IP address for the gateways."
}

output "nat_gateway_subnet_ids" {
  value       = aws_nat_gateway.private-subnet.*.subnet_id
  description = "The Subnet IDs of the subnet in which the NAT gateways are placed."
}

output "nat_gateway_network_interface_ids" {
  value       = aws_nat_gateway.nat-gateway.*.network_interface_id
  description = "The ENI IDs of the network interface created by the NAT gateways."
}

output "nat_gateway_private_ips" {
  value       = aws_nat_gateway.nat-gateway.*.private_ip
  description = "The private IP addresses of the NAT Gateways."
}

output "nat_gateway_public_ips" {
  value       = aws_nat_gateway.nat-gateway.*.public_ip
  description = "The public IP addresses of the NAT Gateways."
}

output "private_route_table_ids" {
  value       = aws_route_table.private-route-table.*.id
  description = "The IDs of the private routing tables."
}

output "private_route_table_association_ids" {
  value       = aws_route_table_association.private-route-association.*.id
  description = "The IDs of the private associations."
}

output "private_network_acl_id" {
  value       = aws_network_acl.private-nacl.id
  description = "The ID of the private network ACL."
}

output "private_ingress_network_acl_rule_id" {
  value       = aws_network_acl_rule.private_ingress.id
  description = "The ID of the private ingress network ACL Rule."
}

output "private_egress_network_acl_rule_id" {
  value       = aws_network_acl_rule.private_egress.id
  description = "The ID of the private egress network ACL Rule."
}
