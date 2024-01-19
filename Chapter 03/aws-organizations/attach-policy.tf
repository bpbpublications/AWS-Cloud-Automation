module "hr" {
  // the source is our previously defined module
  source    = "modules/aws-organization-account"
  name      = "hr"
  parent_id = aws_organizations_organizational_unit.hr.ou_id
  email     = "hr@awscloudautomation.com"
}
  
module "finance" {
  source    = "modules/aws-organization-account"
  name      = "finance"
  parent_id = aws_organizations_organizational_unit.finance.ou_id
  email     = "finance@awscloudautomation.com"
}
