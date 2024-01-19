resource "aws_backup_vault" "aws_backup_vault" {
  name        = "aws_backup_vault"
  kms_key_arn = aws_kms_key.aws_kms_key.arn
}
