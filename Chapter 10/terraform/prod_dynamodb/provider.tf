terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "archive" {}
data "archive_file" "zip" {
  type        = "zip"
  source_file = "zip_files/lambda_csv_2_dynamodb.py"
  output_path = "lambda_csv_2_dynamodb.zip"
}

data "archive_file" "zip1" {
  type        = "zip"
  source_file = "zip_files/lambda_rest_api.py"
  output_path = "lambda_rest_api.zip"
}
