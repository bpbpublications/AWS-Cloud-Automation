variable "project_name" {
  description = "Unique name for this project"
  type        = string
}

variable "role_arn" {
  description = "This is Codepipeline IAM role arn. "
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "The Name of the S3 bucket used to store the deployment artifacts"
  type        = string
}

variable "tags" {
  description = "The Tags to be applied to the codebuild project"
  type        = map(any)
}

variable "build_projects" {
  description = "The List of Names of the CodeBuild projects to be created"
  type        = list(string)
}

variable "builder_compute_type" {
  description = "The Information about the compute resources the build project will use"
  type        = string
}

variable "builder_image" {
  description = "AMI image to use for the build project"
  type        = string
}

variable "builder_type" {
  description = "The Type of build environment to use for related builds"
  type        = string
}

variable "builder_image_pull_credentials_type" {
  description = "The Type of credentials AWS CodeBuild uses to pull images for the build."
  type        = string
}

variable "build_project_source" {
  description = "The Information about the build output artifact locations"
  type        = string
}

variable "kms_key_arn" {
  description = "The ARN of KMS key for encryption of deployments"
  type        = string
}
