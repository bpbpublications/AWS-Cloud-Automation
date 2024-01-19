#
# AUTHOR: James Odeyinka "odeyinka2001@yahoo.com"
# DATE CREATED:
#
terraform {
  required_version = "~> 2.0"
}

provider "aws" {
  region                  = "us-east-1"
#  shared_credentials_file = pathexpand("~/.aws/credentials")
}

#module "backup" {
#  source      = "module/backup"
#  name        = "TEST"
#  environment = "stage"

  # AWS Backup vault
  enable_backup_vault      = true
  backup_vault_name        = ""
  backup_vault_kms_key_arn = null

  # AWS Backup plan
  enable_backup_plan = true
  backup_plan_name   = ""
  backup_plan_rule = [{
    rule_name = "rule-name-1"
    schedule  = "cron(0 12 * * ? *)"
  }]

  # AWS backup selection
  enable_backup_selection       = true
  backup_selection_name         = ""
  backup_selection_iam_role_arn = "arn:aws:iam::758678122039:group/awscademo-mfa-superadmins"
  backup_selection_resources    = []

  tags = tomap({
    "Environment"   = "Dev",
    "Createdby"     = "James Odeyinka",
    "Orchestrator" = "Terraform"
  })
}
