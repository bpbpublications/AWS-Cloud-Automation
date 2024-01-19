terraform {
  backend "s3" {
  dynamodb_table = "terraform-state"
  region = "us-east-2"

  }
}

