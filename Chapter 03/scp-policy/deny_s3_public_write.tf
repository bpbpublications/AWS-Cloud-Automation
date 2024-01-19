resource "aws_config_config_rule" "denyS3Public-ConfigRule" {
  name = "s3-bucket-public-write-prohibited"
  description = "A Config rule that checks that your Amazon S3 buckets do not allow public write access. If an Amazon S3 bucket policy or bucket ACL allows public write access, the bucket is noncompliant."

  source {
    owner = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
  }
  scope {
    compliance_resource_types = ["AWS::S3::Bucket"]
  }
}
