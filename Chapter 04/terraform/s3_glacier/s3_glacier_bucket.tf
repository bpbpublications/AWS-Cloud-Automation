# Creating the s3 glacier bucket

resource "aws_s3_bucket" "s3glacier-demo-bucket" {
  bucket = "s3glacier-demo-bucket"
  acl    = "private"
 
  lifecycle_rule {
    id      = "archive"
    enabled = true

    prefix = "archive/"

    tags = {
       rule = "archive"
       CreatedBy = "James Odeyinka",
       DateCreated = "02-25-2023",
       Env = "Demo"
    }

    transition {
      days          = 30
      storage_class = "ONEZONE_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 120
    }
  }
}

resource "aws_s3_bucket_object" "prod-lifecycle-mgt" {
  bucket = "${aws_s3_bucket.s3glacier-demo-bucket.id}"
  acl    = "private"
  key    = "prod/"
  source = "/dev/null"
}


resource "aws_s3_bucket_object" "lifecycle-archive-mgt" {
  bucket = "${aws_s3_bucket.s3glacier-demo-bucket.id}"
  acl    = "private"
  key    = "archive/"
  source = "/dev/null"
}
