## Admin group
resource "aws_iam_group" "mfa-only-admin-group" {
  name = format("%smfa-only-admins", var.name)
}

resource "aws_iam_role" "admin-role" {
  name_prefix          = substr(format("%smfa-only-admins-role", var.name), 0, 31)
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
  depends_on  = [aws_iam_group.mfa-only-admin-group]
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
  group      = aws_iam_group.mfa-only-admin-group.name
  policy_arn = aws_iam_policy.assume-role-mfa-policy.arn
  depends_on = [
    aws_iam_group.mfa-only-admin-group,
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
