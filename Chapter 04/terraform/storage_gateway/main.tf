resource "aws_storagegateway_gateway" "sgw1" {
  gateway_name       = var.gateway_name
  gateway_timezone   = var.gateway_timezone
  gateway_type       = "FILE_S3"
  gateway_ip_address = var.gateway_ip_address

}

resource "aws_storagegateway_nfs_file_share" "file_share" {
  client_list  = ["0.0.0.0/0"]
  gateway_arn  = aws_storagegateway_gateway.sgw1.arn
  location_arn = aws_s3_bucket.gate_buc.arn
  role_arn     = aws_iam_role.role.arn
}

resource "aws_iam_policy" "policy" {
  name        = "S3_policy"
  description = "Providing limited S3 powers"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
      "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketLocation",
                "s3:GetBucketVersioning",
                "s3:ListBucket",
                "s3:ListBucketVersions",
                "s3:ListBucketMultipartUploads"
            ],
            "Resource": "arn:aws:s3:::${var.bucket_name}",
            "Effect": "Allow"
        },
        {
            "Action": [
                "s3:AbortMultipartUpload",
                "s3:DeleteObject",
                "s3:DeleteObjectVersion",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:GetObjectVersion",
                "s3:ListMultipartUploadParts",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::${var.bucket_name}/*",
            "Effect": "Allow"
        }
    ]
  })
}

resource "aws_iam_role" "role" {
  name = "gateway_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "storagegateway.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_s3_bucket" "gate_buc" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

}
