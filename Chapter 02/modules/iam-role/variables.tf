variable "source_repository_name" {
  type        = string
  description = "This is the Name of the Source CodeCommit repository"
}

variable "project_name" {
  description = "This is the name for this project"
  type        = string
}

variable "codepipeline_iam_role_name" {
  description = "This is the Name of the IAM role to be used by the project"
  type        = string
}

variable "tags" {
  description = "This is the Tags to be attached to the IAM Role"
  type        = map(any)
}

variable "kms_key_arn" {
  description = "This is the ARN of KMS key for encryption"
  type        = string
}

variable "s3_bucket_arn" {
  description = "This is the ARN of the S3 Bucket"
  type        = string
}

variable "create_new_role" {
  type        = bool
  description = "Set this Flag for deciding if a new role needs to be created"
  default     = true
}
