resource "aws_kms_alias" "aws_kms_alias" {
  name          = "alias/aws-backup-kms"
  target_key_id = aws_kms_key.aws_kms_key.key_id
}
