provider "aws" {
  region = "us-east-2"
}

module "custom_module" {
  source                 = "git::https://git-codecommit.us-east-1.amazonaws.com/v1/repos/awscloudautomation=branch"
  repo_name              = "awscloudautomation"
  repo_default_branch    = "custom_module"
  aws_region             = "us-east-2"
  char_delimiter         = "-"
  environment            = "dev"
  build_timeout          = "5"
  build_compute_type     = "BUILD_GENERAL1_SMALL"
  build_image            = "aws/codebuild/nodejs:6.3.1"
  test_buildspec         = "buildspec_test.yml"
  package_buildspec      = "buildspec.yml"
  force_artifact_destroy = true
}
