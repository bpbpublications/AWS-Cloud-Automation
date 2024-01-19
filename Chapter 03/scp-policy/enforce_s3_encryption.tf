resource "aws_organizations_policy" "S3Encryption-ScpPolicy" {
  name = "scp_s3_encryption"
  description = "This SCP requires that all Amazon S3 buckets use AES256 encryption in an AWS Account. "
  type = "SERVICE_CONTROL_POLICY"
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "AES256"
        }
      }
    },
    {
      "Action": [
        "s3:PutObject"
      ],
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "Bool": {
          "s3:x-amz-server-side-encryption": false
        }
      }
    }
  ]
}
POLICY

}
