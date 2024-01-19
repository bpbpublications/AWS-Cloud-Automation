variable "project_name" {
  description = "Your Project Name"
  type        = string
}

variable "create_new_repo" {
  description = "This gives you choice of creating new repository or not. Choice Values are true or false. Default Value is true."
  type        = bool
  default     = true
}

variable "create_new_role" {
  description = "This gives you choice of creating new IAM Role. Choice Values are true or false. Default Value is true."
  type        = bool
  default     = true
}

variable "codepipeline_iam_role_name" {
  description = "Name of the IAM role to be used by the Codepipeline. You can changes this to your own existing role"
  type        = string
  default     = "codepipeline-role"
}

variable "source_repo_name" {
  description = "Source Repository name of the CodeCommit repository. Existing or New Repository"
  type        = string
}

variable "source_repo_branch" {
  description = "This is the Default branch in the Source repo for which CodePipeline needs to be configured. Use Master if you don't know"
  type        = string
}

variable "repo_approvers_arn" {
  description = "ARN for the IAM User/Role/Group that can be used for approving Pull Requests. You can default this to zero for testing"
  type        = string
}

variable "environment" {
  description = "Environment in which the script is run. Eg: test, PoC, dev, staging, qa, preprod, prod, etc"
  type        = string
}

variable "stage_input" {
  description = "Tags to be attached to the CodePipeline when deploying"
  type        = list(map(any))
}

variable "build_projects" {
  description = "Tags to be attached to the CodePipeline when deploying"
  type        = list(string)
}

variable "builder_compute_type" {
  description = "This is the EC2 type to be used for builds. You may need to change the size based on your build workload "
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "builder_image" {
  description = "AMI Image to be used by codebuild"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
}

variable "builder_type" {
  description = "Type of codebuild run environment. Linux is a good run time to use because it always packaged with prerequisites"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "builder_image_pull_credentials_type" {
  description = "Credentials that will be used to pull the Image used by codebuild project"
  type        = string
  default     = "CODEBUILD"
}

variable "build_project_source" {
  description = "This build will use aws/codebuild/standard:4.0"
  type        = string
  default     = "CODEPIPELINE"
}
