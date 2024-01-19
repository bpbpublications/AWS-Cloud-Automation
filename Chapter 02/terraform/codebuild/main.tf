data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "awscs-codepipeline-bucket" {
  bucket_prefix = "codebuild-awscs"
}

resource "aws_s3_bucket_acl" "awscs-codepipeline-acl" {
  bucket = aws_s3_bucket.awscs-codepipeline-bucket.id
  acl    = "private"
}

resource "aws_ecr_repository" "aws-cloud-automation-ecr" {
  name                 = "aws-cloud-automation-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ssm_parameter" "aws-cloud-automation" {
  name        = "/codeBuild/dockerPassword"
  description = "The Dockerhub password"
  type        = "SecureString"
  value       = var.dockerhub_password
}

resource "aws_iam_role" "aws-cloud-automation-iamrole" {
  name = "aws-cloud-automation-iamrole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "aws-cloud-automation-iampolicy" {
  role = aws_iam_role.aws-cloud-automation-iamrole.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "${aws_s3_bucket.awscs-codepipeline-bucket.arn}",
        "${aws_s3_bucket.awscs-codepipeline-bucket.arn}/*"
      ]
    },
    {
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
      ],
      "Resource": "*",
      "Effect": "Allow"
    },
    {
      "Action" : [
        "ssm:GetParameters"
      ],
      "Resource" : "*",
      "Effect" : "Allow"
    }
  ]
}
POLICY
}

resource "aws_codebuild_project" "aws-cloud-automation" {
  name          = "aws-cloud-automation"
  description   = "aws-cloud-automation app build project"
  build_timeout = "5"
  service_role  = aws_iam_role.aws-cloud-automation-iamrole.arn

  artifacts {
    type     = "S3"
    location = aws_s3_bucket.awscs-codepipeline-bucket.bucket
  }

  cache {
    type     = "S3"
    location = aws_s3_bucket.awscs-codepipeline-bucket.bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = data.aws_caller_identity.current.account_id
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${aws_s3_bucket.awscs-codepipeline-bucket.id}/build-log"
    }
  }

  source {
    type            = "CODECOMMIT"
    location        = "https://git-codecommit.us-east-2.amazonaws.com/v1/repos/aws-cloud-automation"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  source_version = "master"

  tags = {
    Environment = "Test"
  }
}
