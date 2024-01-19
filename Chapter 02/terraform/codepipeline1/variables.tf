variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  default     = "eu-east-2"
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "master"
}

variable "repository_owner" {
  description = "CodeCommit repository owner"
  default     = "AWS"
}

variable "repository_name" {
  description = "codeCommit repository name"
  default     = "aws-cloud-automation"
}

variable "static_web_bucket_name" {
  description = "S3 Bucket to deploy to"
  default     = "s3-awscloudautomation-demo"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "s3-awscloudautomation-demo"
}
