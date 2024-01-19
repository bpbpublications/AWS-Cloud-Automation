output "codecommit_name" {
  value       = module.codecommit_infrastructure_source_repo.repository_name
  description = "Codecommit repository Name"
}

output "codecommit_url" {
  value       = module.codecommit_infrastructure_source_repo.clone_url_http
  description = "Codecommit repository URL"
}

output "codecommit_arn" {
  value       = module.codecommit_infrastructure_source_repo.arn
  description = "Codecommit repository ARN"
}

output "codebuild_name" {
  value       = module.codebuild_terraform.name
  description = "Codebuild Project Name"
}

output "codebuild_arn" {
  value       = module.codebuild_terraform.arn
  description = "Codebuild Project ARN"
}

output "codepipeline_name" {
  value       = module.codepipeline_terraform.name
  description = "CodePipeline Name"
}

output "codepipeline_arn" {
  value       = module.codepipeline_terraform.arn
  description = "CodePipeline ARN"
}

output "iam_arn" {
  value       = module.codepipeline_iam_role.role_arn
  description = "ARN of CodePipeline IAM Role"
}

output "kms_arn" {
  value       = module.codepipeline_kms.arn
  description = "KMS ARN"
}

output "s3_arn" {
  value       = module.s3_artifacts_bucket.arn
  description = "ARN of S3 Bucket"
}

output "s3_bucket_name" {
  value       = module.s3_artifacts_bucket.bucket
  description = "S3 Bucket Name"
}
