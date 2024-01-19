
resource "aws_cloudtrail" "cloudtrail" {
  name                          = "infra-cloud-trail"
  s3_bucket_name                = "cloudtrail-infra-prod"
  s3_key_prefix                 = "trail-key"
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  enable_log_file_validation    = true

 event_selector {
    read_write_type = "WriteOnly"

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::cloudtrail-infra-prod/*"]
    }
  }
}

