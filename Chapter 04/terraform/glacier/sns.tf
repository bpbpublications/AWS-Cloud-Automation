resource "aws_sns_topic" "glacier-demo-sns" {
  name_prefix       = var.sns_topic_name
  kms_master_key_id = "alias/aws/sns"
  tags = {
    key = "glacier-demo-sns"
  }
}
