resource "aws_vpc" "demo-rds-db-vpc" {
  cidr_block           = "10.10.0.0/20"
        # needed for the interface endpoint
  enable_dns_support   = true
  enable_dns_hostnames = true
}
