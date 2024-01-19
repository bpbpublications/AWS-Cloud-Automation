resource "aws_config_config_rule" "enforceMfa-ConfigRule" {
  name = "mfa-enabled-for-iam-console-access"
  description = "A Config rule that checks whether AWS Multi-Factor Authentication (MFA) is enabled for all AWS Identity and Access Management (IAM) users that use a console password. The rule is COMPLIANT if MFA is enabled."

  source {
    owner = "AWS"
    source_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"
  }
  scope {
    compliance_resource_types = []
  }
}
