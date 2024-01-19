resource "aws_glacier_vault" "glacier-demo-vault" {
  #checkov:skip= CKV_AWS_167:TODO
  name = var.vault_name

  notification {
    sns_topic = aws_sns_topic.glacier-demo-sns.arn
    events    = ["ArchiveRetrievalCompleted", "InventoryRetrievalCompleted"]
  }

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:${local.region}:${local.account_id}:vaults/${var.vault_name}"
       }
    ]
}
EOF
  tags = {
    key = ""
  }
}

locals {
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
