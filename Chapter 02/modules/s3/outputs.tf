output "arn" {
  value       = aws_s3_bucket.codepipeline_bucket.arn
  description = "This is the ARN of the S3 Bucket"
}

output "bucket" {
  value       = aws_s3_bucket.codepipeline_bucket.bucket
  description = "This is the Name of the S3 Bucket"
}

output "bucket_url" {
  value       = "https://s3.console.aws.amazon.com/s3/buckets/${aws_s3_bucket.codepipeline_bucket.bucket}?region=${aws_s3_bucket.codepipeline_bucket.region}&tab=objects"
  description = "This is the URL of the S3 Bucket"
}
