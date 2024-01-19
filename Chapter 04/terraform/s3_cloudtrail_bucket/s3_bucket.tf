resource "aws_s3_bucket" "cloudtrail-bucket" {
 bucket = "prod-infra-cloudtrail-bucket"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail-bucket-encryption" {
  bucket = aws_s3_bucket.cloudtrail-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.general-encryption-bucket-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_acl" "cloudtrail-private-acl" {
  bucket = aws_s3_bucket.cloudtrail-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "clludtrail-block-acl" {
 bucket = aws_s3_bucket.cloudtrail-bucket.id

 block_public_acls       = true
 block_public_policy     = true
 ignore_public_acls      = true
 restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "cloudtrail-bucket-versioning" {
 bucket = aws_s3_bucket.cloudtrail-bucket.id

 versioning_configuration {
   status = "Enabled"
 }
}
