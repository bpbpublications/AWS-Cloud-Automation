resource "aws_organizations_policy" "PreventKmsDelete-ScpPolicy" {
  name = "scp_kms_delete_keys"
  description = "This SCP prevents users or roles in any affected account from deleting KMS keys, either directly as a command or through the console. "
  type = "SERVICE_CONTROL_POLICY"
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "kms:ScheduleKeyDeletion",
        "kms:Delete*"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}
