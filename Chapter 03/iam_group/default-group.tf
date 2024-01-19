 policy json from AWS policy generator
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
  group      = aws_iam_group.default-user-group.name
  policy_arn = aws_iam_policy.self-management-policy.arn
  depends_on = [
    aws_iam_group.default-user-group,
    aws_iam_policy.self-management-policy,
  ]
}
