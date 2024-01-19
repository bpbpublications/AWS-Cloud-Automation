provider "aws" {
  region  = "us-east-2"
}

module "cloudfront" {
  source = "./modules/"

  SiteTags          = var.SiteTags
  domainName        = var.domainName
}
