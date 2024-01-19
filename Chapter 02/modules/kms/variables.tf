variable "tags" {
  description = "This is the Tags to be attached to the KMS Key"
  type        = map(any)
}

variable "codepipeline_role_arn" {
  description = "This is the ARN of the codepipeline IAM role"
  type        = string
}
