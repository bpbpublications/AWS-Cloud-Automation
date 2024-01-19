# Config 

terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">= 2.0"
  }
}

provider "aws" {
  region = var.region
}

# Variables

variable "name" {
  description = "Name for prefixes (including tailing dash)"
  type        = string
  default     = "awscademo-"
}
variable "region" {
  description = "Region for AWS ressources"
  type        = string
  default     = "us-east-1"
}

variable "tags-to-value" {
  type = map(string)
  default = {
    contact     = "odeyinka2001@yahoo.com"
    ttl         = "infinity"
    deployed-by = "terraform"
    date-deployed = "02-04-2023"
  }
  description = "Map of mandatory tags"
}


# IAM

## Default Group

resource "aws_iam_group" "demo-user-group" {
  name = format("%sdemo-users", var.name)
}

resource "aws_iam_policy" "self-management-policy" {
  name_prefix = substr(format("%suser-self-management-policy", var.name), 0, 31)
  description = format(
    "Policy for user self management of pwd, mfa device for %s",
    var.name,
  )
  ### Remark: During copy paste the policy json from AWS policy generator
  ### one has to escape the HCL reserved "${" by a second $ to indicate the use of AWS variables
  ### Better way would be to use fucntions file() and templatefile with external stored policy json files
  policy = <<EOP
{
    "Statement": [
      {
        "Action": [
          "iam:ChangePassword",
          "iam:*LoginProfile",
          "iam:*AccessKey*",
          "iam:*SSHPublicKey*",
          "iam:ListUserPolicies",
          "iam:ListAttachedUserPolicies",
          "iam:ListGroupsForUser"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:iam:::user/$${aws:username}",
        "Sid": "AllowCredentialManagement"
      },
      {
        "Action": [
          "iam:ListAccount*",
          "iam:GetAccountSummary",
          "iam:GetAccountPasswordPolicy",
          "iam:ListUsers"
        ],
        "Effect": "Allow",
        "Resource": "*",
        "Sid": "AllowConsoleUsage"
      },
      {
        "Action": [
          "iam:CreateVirtualMFADevice",
          "iam:EnableMFADevice",
          "iam:ResyncMFADevice"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:iam:::mfa/$${aws:username}",
          "arn:aws:iam:::user/$${aws:username}"
        ],
        "Sid": "AllowMfaCreateEnableResync"
      },
      {
        "Action": [
          "iam:ListMFADevices",
          "iam:ListVirtualMFADevices"
        ],
        "Effect": "Allow",
        "Resource": "*",
        "Sid": "AllowMfaFromConsole"
      },
      {
        "Action": [
          "iam:ListAccountAliases",
          "iam:ListUsers",
          "iam:ListVirtualMFADevices",
          "iam:GetAccountPasswordPolicy",
          "iam:GetAccountSummary"
        ],
        "Effect": "Allow",
        "Resource": "*",
        "Sid": "AllowAllUsersToListAccounts"
      },
      {
        "Action": [
          "iam:ChangePassword",
          "iam:CreateAccessKey",
          "iam:CreateLoginProfile",
          "iam:DeleteAccessKey",
          "iam:DeleteLoginProfile",
          "iam:GetLoginProfile",
          "iam:ListAccessKeys",
          "iam:UpdateAccessKey",
          "iam:UpdateLoginProfile",
          "iam:ListSigningCertificates",
          "iam:DeleteSigningCertificate",
          "iam:UpdateSigningCertificate",
          "iam:UploadSigningCertificate",
          "iam:ListSSHPublicKeys",
          "iam:GetSSHPublicKey",
          "iam:DeleteSSHPublicKey",
          "iam:UpdateSSHPublicKey",
          "iam:UploadSSHPublicKey"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:iam::*:user/$${aws:username}",
        "Sid": "AllowIndividualUserToSeeAndManageOnlyTheirOwnAccountInformation"
      },
      {
        "Action": [
          "iam:CreateVirtualMFADevice",
          "iam:DeleteVirtualMFADevice",
          "iam:EnableMFADevice",
          "iam:ListMFADevices",
          "iam:ResyncMFADevice"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:iam::*:mfa/$${aws:username}",
          "arn:aws:iam::*:user/$${aws:username}"
        ],
        "Sid": "AllowIndividualUserToViewAndManageTheirOwnMFA"
      },
      {
        "Action": [
          "iam:DeactivateMFADevice"
        ],
        "Condition": {
          "Bool": {
            "aws:MultiFactorAuthPresent": "true"
          }
        },
        "Effect": "Allow",
        "Resource": [
          "arn:aws:iam::*:mfa/$${aws:username}",
          "arn:aws:iam::*:user/$${aws:username}"
        ],
        "Sid": "AllowIndividualUserToDeactivateOnlyTheirOwnMFAOnlyWhenUsingMFA"
      }
    ],
    "Version": "2012-10-17"
  }

EOP
}

resource "aws_iam_group_policy_attachment" "self-management-attach" {
  group      = aws_iam_group.demo-user-group.name
  policy_arn = aws_iam_policy.self-management-policy.arn
  depends_on = [
    aws_iam_group.demo-user-group,
    aws_iam_policy.self-management-policy,
  ]
}

## Read only Group

resource "aws_iam_group" "readonly-user-group" {
  name = format("%sreadonly-users", var.name)
}

data "aws_iam_policy" "readonly-access-managed-policy" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "readonly-attach" {
  group      = aws_iam_group.readonly-user-group.name
  policy_arn = data.aws_iam_policy.readonly-access-managed-policy.arn
  depends_on = [
    aws_iam_group.readonly-user-group,
    data.aws_iam_policy.readonly-access-managed-policy,
  ]
}

## Admin group
resource "aws_iam_group" "mfa-superadmin-group" {
  name = format("%smfa-superadmins", var.name)
}

resource "aws_iam_role" "admin-role" {
  name_prefix          = substr(format("%smfa-superadmins-role", var.name), 0, 31)
  assume_role_policy   = data.aws_iam_policy_document.admin-assume-role-document.json
  max_session_duration = 43200 # 43200 seconds is the supported maximum, i.e. 12 hours
}

data "aws_iam_policy_document" "admin-policy-document" {
  statement {
    actions = [
      "*",
    ]
    effect = "Allow"
    resources = [
      "*",
    ]
    condition {
        test     = "BoolIfExists"
        variable = "aws:MultiFactorAuthPresent"
        values = [
        "true"
        ]      
      } 
  }
}

resource "aws_iam_policy" "admin-policy" {
  name_prefix = substr(format("%sadmin-access-policy", var.name), 0, 31)
  description = format("Permits full admin access for %s", var.name)
  path        = "/"
  policy      = data.aws_iam_policy_document.admin-policy-document.json
}

resource "aws_iam_role_policy_attachment" "admin-role-attach" {
  role       = aws_iam_role.admin-role.name
  policy_arn = aws_iam_policy.admin-policy.arn
  depends_on = [
    aws_iam_role.admin-role,
    aws_iam_policy.admin-policy,
  ]
}

resource "aws_iam_policy" "assume-role-mfa-policy" {
  depends_on  = [aws_iam_group.mfa-superadmin-group]
  name_prefix = substr(format("%sassume-admin-role-with-mfa-policy", var.name), 0, 31)
  path        = "/"
  description = format("Assume admin role with MFA only policy for %s", var.name)

  policy = <<EOP
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "${aws_iam_role.admin-role.arn}",
            "Condition": {
                "BoolIfExists": {
                    "aws:MultiFactorAuthPresent": "true"
                }
            }
        }
    ]
}
EOP

}

resource "aws_iam_group_policy_attachment" "admin-assume-role-mfa-attach" {
  group      = aws_iam_group.mfa-superadmin-group.name
  policy_arn = aws_iam_policy.assume-role-mfa-policy.arn
  depends_on = [
    aws_iam_group.mfa-superadmin-group,
    aws_iam_policy.assume-role-mfa-policy,
  ]
}

data "aws_caller_identity" "current" {
}

data "aws_iam_policy_document" "admin-assume-role-document" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}



# Outputs

output "mfa-superadmin-group" {
  description = "The name of the IAM group for admins"
  value       = "${aws_iam_group.mfa-superadmin-group.id}"
}

output "read-only-group" {
  description = "The name of the IAM group for read only access permissions"
  value       = "${aws_iam_group.readonly-user-group.id}"
}

output "default-group" {
  description = "The name of the IAM group for evryone"
  value       = "${aws_iam_group.demo-user-group.id}"
}
