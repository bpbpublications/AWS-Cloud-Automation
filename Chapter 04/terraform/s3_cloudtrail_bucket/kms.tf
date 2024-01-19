resource "aws_kms_key" "general-encryption-bucket-key" {
 description             = "This key is used to encrypt bucket objects"
 deletion_window_in_days = 10
 enable_key_rotation     = true
}

resource "aws_kms_alias" "key-alias" {
 name          = "alias/general-encryption-bucket-key"
 target_key_id = aws_kms_key.general-encryption-bucket-key.key_id
}
