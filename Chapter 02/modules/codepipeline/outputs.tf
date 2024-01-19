output "id" {
  value       = aws_codepipeline.terraform_pipeline.id
  description = "This is the id of the CodePipeline"
}

output "name" {
  value       = aws_codepipeline.terraform_pipeline.name
  description = "This is the name of the CodePipeline"
}

output "arn" {
  value       = aws_codepipeline.terraform_pipeline.arn
  description = "This is the arn of the CodePipeline"
}
