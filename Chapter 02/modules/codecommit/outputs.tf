output "clone_url_http" {
  value       = var.create_new_repo ? aws_codecommit_repository.source_repository[0].clone_url_http : data.aws_codecommit_repository.existing_repository[0].clone_url_http
  description = "This List contains the clone url of the CodeCommit repositories"
}

output "repository_name" {
  value       = var.create_new_repo ? aws_codecommit_repository.source_repository[0].repository_name : var.source_repository_name
  description = "This List contains the name of the CodeCommit repositories"
}

output "arn" {
  value       = var.create_new_repo ? aws_codecommit_repository.source_repository[0].arn : data.aws_codecommit_repository.existing_repository[0].arn
  description = "This List contains the arn of the CodeCommit repositories"
}
