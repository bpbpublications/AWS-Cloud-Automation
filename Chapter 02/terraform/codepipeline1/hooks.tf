resource "aws_codepipeline_webhook" "codepipeline_webhook" {
  name            = "codepipeline-webhook"
  target_action   = "Source"
  target_pipeline = aws_codepipeline.static_web_pipeline.name


  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
  tags = {}
}

resource "github_repository_webhook" "github_hook" {
  repository = var.repository_name
  events     = ["push"]

  configuration {
    url          = aws_codepipeline_webhook.codepipeline_webhook.url
    insecure_ssl = "0"
    content_type = "json"
  }
}
