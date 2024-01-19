data "aws_caller_identity" "current" {}

locals {
  account-id = data.aws_caller_identity.current.account_id
  region      = "us-east-2"
}
