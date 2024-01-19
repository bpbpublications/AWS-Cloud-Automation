## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.53.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.demo-user-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.mfa-superadmin-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.readonly-user-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.admin-assume-role-mfa-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.readonly-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.self-management-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.admin-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.assume-role-mfa-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.self-management-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.admin-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.admin-role-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy.readonly-access-managed-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.admin-assume-role-document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.admin-policy-document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name for prefixes (including tailing dash) | `string` | `"awscademo-"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region for AWS ressources | `string` | `"us-east-1"` | no |
| <a name="input_tags-to-value"></a> [tags-to-value](#input\_tags-to-value) | Map of mandatory tags | `map(string)` | <pre>{<br>  "contact": "odeyinka2001@yahoo.com",<br>  "date-deployed": "02-04-2023",<br>  "deployed-by": "terraform",<br>  "ttl": "infinity"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default-group"></a> [default-group](#output\_default-group) | The name of the IAM group for evryone |
| <a name="output_mfa-superadmin-group"></a> [mfa-superadmin-group](#output\_mfa-superadmin-group) | The name of the IAM group for admins |
| <a name="output_read-only-group"></a> [read-only-group](#output\_read-only-group) | The name of the IAM group for read only access permissions |
