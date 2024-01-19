## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 5.16.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.static_web_build](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_codepipeline.static_web_pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_codepipeline_webhook.codepipeline_webhook](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline_webhook) | resource |
| [github_repository_webhook.github_hook](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_webhook) | resource |
| [template_file.buildspec](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifacts_bucket_name"></a> [artifacts\_bucket\_name](#input\_artifacts\_bucket\_name) | S3 Bucket for storing artifacts | `string` | `"s3-awscloudautomation-demo"` | no |
| <a name="input_env"></a> [env](#input\_env) | Depolyment environment | `string` | `"dev"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-east-2"` | no |
| <a name="input_repository_branch"></a> [repository\_branch](#input\_repository\_branch) | Repository branch to connect to | `string` | `"master"` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | codeCommit repository name | `string` | `"aws-cloud-automation"` | no |
| <a name="input_repository_owner"></a> [repository\_owner](#input\_repository\_owner) | CodeCommit repository owner | `string` | `"AWS"` | no |
| <a name="input_static_web_bucket_name"></a> [static\_web\_bucket\_name](#input\_static\_web\_bucket\_name) | S3 Bucket to deploy to | `string` | `"s3-awscloudautomation-demo"` | no |

## Outputs

No outputs.
