# config.tf

provider "aws" {
  region = "us-east-2"
}

terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    encrypt = true
    region = "us-east-2"
  }
}
