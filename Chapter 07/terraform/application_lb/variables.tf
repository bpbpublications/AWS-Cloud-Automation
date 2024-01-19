variable "subnet_cidr_private" {
  description = "cidr blocks for the private subnets"
  default     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  type        = list(any)
}

variable "availability_zone" {
  description = "availability zones for the private subnets"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
  type        = list(any)
}
