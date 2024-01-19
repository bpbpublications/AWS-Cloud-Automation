variable "project_name" {
  description = "This is the Name of the project to be prefixed to create the s3 bucket"
  type        = string
}
variable "tags" {
  description = "This is the Tags to be associated with the S3 bucket"
  type        = map(any)
}

variable "kms_key_arn" {
  description = "This is the ARN of KMS key for encryption"
  type        = string
}

variable "codepipeline_role_arn" {
  description = "This is the ARN of the codepipeline IAM role"
  type        = string
}
