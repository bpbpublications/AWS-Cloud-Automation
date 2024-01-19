resource "aws_vpc_peering_connection" "chapter5-demo-vpc2chapter5-demo-vpcb" {
  # Main VPC ID.
  vpc_id = "${aws_vpc.chapter5-demo-vpc.id}"

  # AWS Account ID. This can be dynamically queried using the
  # aws_caller_identity data resource.
  # https://www.terraform.io/docs/providers/aws/d/caller_identity.html
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"

  # Secondary VPC ID.
  peer_vpc_id = "${aws_vpc.chapter5-demo-vpcb.id}"

  # Flags that the peering connection should be automatically confirmed. This
  # only works if both VPCs are owned by the same account.
  auto_accept = true
}
