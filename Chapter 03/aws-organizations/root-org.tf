/*
Retrieve root organization
*/
data "aws_organizations_organization" "root" {}
locals {
  root_id = data.aws_organizations_organization.root.roots[0].id
}

#Create new organizations
resource "aws_organizations_organizational_unit" "hr" {
  name      = "HR_OU"
  parent_id = local.root_id
}
resource "aws_organizations_organizational_unit" "finance" {
  name      = "FINANCE_OU"
  parent_id = local.root_id
}
