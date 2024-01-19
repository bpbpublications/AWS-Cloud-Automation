terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

variable "cluster_name" {
  default = "demoeks"
}

variable "cluster_version" {
  default = "1.25"
}
