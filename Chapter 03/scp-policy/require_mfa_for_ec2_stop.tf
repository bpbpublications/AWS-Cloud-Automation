resource "aws_organizations_policy" "ec2mfaenforcer-ScpPolicy" {
  name = "scp_ec2_stop_mfa"
  description = "This SCP requires that multi-factor authentication (MFA) is enabled before a principal or root user can stop an Amazon EC2 instance. "
  type = "SERVICE_CONTROL_POLICY"
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:StopInstances",
        "ec2:TerminateInstances"
      ],
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "BoolIfExists": {
          "aws:MultiFactorAuthPresent": false
        }
      }
    }
  ]
}
POLICY

}
