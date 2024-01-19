resource "aws_backup_selection" "aws_backup_selection" {
  iam_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/service-role/AWSBackupDefaultServiceRole"
  name         = "backup_selection"
  plan_id      = aws_backup_plan.aws_backup_plan.id
  resources    = [local.efs_arn]
}
