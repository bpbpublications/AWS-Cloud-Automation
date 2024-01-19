# Variables

variable "name" {
  description = "Name for prefixes (including tailing dash)"
  type        = string
  default     = "awscademo-"
}

variable "region" {
  description = "Region for AWS ressources"
  type        = string
  default     = "us-east-1"
}

variable "tags-to-value" {
  type = map(string)
  default = {
    contact     = "odeyinka2001@yahoo.com"
    ttl         = "infinity"
    deployed-by = "terraform"
    date-deployed = "02-04-2023
  }
  description = "Map of mandatory tags"
}
