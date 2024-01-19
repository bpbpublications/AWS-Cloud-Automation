variable "project_name" {
  description = "This is the name for this project"
  type        = string
}

variable "source_repo_name" {
  description = "This is the Source repo name of the CodeCommit repository"
  type        = string
}

variable "source_repo_branch" {
  description = "this is your Default branch in the Source repo for which CodePipeline needs to be configured"
  type        = string
}

variable "s3_bucket_name" {
  description = "This is our S3 bucket name to be used for storing the artifacts"
  type        = string
}

variable "codepipeline_role_arn" {
  description = "This is the ARN of the codepipeline IAM role"
  type        = string
}

variable "kms_key_arn" {
  description = "This is the ARN of KMS key for encryption"
  type        = string
}

variable "tags" {
  description = "This is deployment Tags to be attached to the CodePipeline"
  type        = map(any)
}

variable "stages" {
  description = "This is the List of Map containing information about the stages of the CodePipeline"
  type        = list(map(any))
}
