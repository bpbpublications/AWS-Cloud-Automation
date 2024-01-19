resource "aws_s3_bucket" "awscloudautomationbook_com" {
  bucket = "awscloudautomationbook.com"
}

resource "aws_s3_bucket" "www_awscloudautomationbook_com" {
  bucket = "www.awscloudautomationbook.com"
}

resource "aws_s3_bucket_cors_configuration" "awscloudautomationbook_com" {
  bucket = aws_s3_bucket.awscloudautomationbook_com.id
  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://awscloudautomationbook.com"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_website_configuration" "awscloudautomationbook_com" {
  bucket = aws_s3_bucket.awscloudautomationbook_com.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "404/error.html"
  }
}

resource "aws_s3_bucket_website_configuration" "www_awscloudautomationbook_com" {
  bucket = aws_s3_bucket.www_awscloudautomationbook_com.bucket
  redirect_all_requests_to {
    host_name = "awscloudautomationbook.com"
  }
}

resource "aws_s3_bucket_policy" "awscloudautomationbook_com_allow_public_access" {
  bucket = aws_s3_bucket.awscloudautomationbook_com.bucket
  policy = data.aws_iam_policy_document.awscloudautomationbook_com_allow_public_access.json
}

resource "aws_s3_bucket_policy" "www_awscloudautomationbook_com_allow_public_access" {
  bucket = aws_s3_bucket.www_awscloudautomationbook_com.bucket
  policy = data.aws_iam_policy_document.www_awscloudautomationbook_com_allow_public_access.json
}

data "aws_iam_policy_document" "awscloudautomationbook_com_allow_public_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.awscloudautomationbook_com.arn}/*"]
  }
}

data "aws_iam_policy_document" "www_awscloudautomationbook_com_allow_public_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.www_awscloudautomationbook_com.arn}/*"]
  }
}
