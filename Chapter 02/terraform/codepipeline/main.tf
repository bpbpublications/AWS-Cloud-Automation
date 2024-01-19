resource "aws_codepipeline" "codePipeline" {
  name = "awscapipeline"
  role_arn = "arn:aws:iam::758678122039:role/AWS-CodePipeline-Service"

  artifact_store {
    location = "aws_s3_bucket.s3-awscloudautomation-demo.bucket"
    type = "S3"
  }
  stage {
    name = "Source"
    action {
      name = "Source"
      category = "Source"
      provider = "CodeCommit"
      version = "1"
      owner = "AWS"
      output_artifacts = ["source_output"]
      configuration = {
        RepositoryName = "aws-cloud-automation"
        BranchName = "master"
        PollForSourceChanges = "true"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"
    action {
      name = "Build"
      category = "Build"
      provider = "CodeBuild"
      version = "1"
      owner = "AWS"
      input_artifacts = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = "aws_codebuild_project.aws-cloud-automation.name"
        BatchEnabled = "true"
        PrimarySource = "codeComit"
        CombineArtifacts = "false"
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name = "Deploy"
      category = "Deploy"
      provider = "S3"
      version = "1"
      owner = "AWS"
      input_artifacts = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        BucketName = "s3-awscloudautomation-demo"
        Extract = "true"
        KMSEncryptionKeyARN = "6335d1cc-9e8b-45f6-8ad6-7f6c56f7ac39"
      }
    }
  }

}
