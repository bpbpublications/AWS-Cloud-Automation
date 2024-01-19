variable "cloudtrail-s3-bucket" {
  description = "Bucket name to store cloudtrail logs"
  default     = "cloudtrail-infra-prod"
}

variable "cloudtrail-access-log" {
  description = "Bucket name to store access logs of cloudtrail log bucket"
  default     = "cloudtrail-infra-prod"
}

variable "cloudtrail-glue-catalog-db" {
  description = "Glue Catalogue to store the results of CloudTrail log crawlers"
  default     = "cloudtrail-glue-catalog-db"
}

variable "env" {
  description = "Development environment e.g. 'dev' or 'prod'"
  default     = "prod"
}

