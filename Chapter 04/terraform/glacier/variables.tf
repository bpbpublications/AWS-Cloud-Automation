variable "vault_name" {
  type = string
}
variable "sns_topic_name" {
  type    = string
  default = "glacier-sns-topic-"
}

variable "ignore_deletion_error" {
  type        = bool
  description = "Allow Terraform to ignore the error returned when attempting to delete the Glacier Lock Policy. This can be used to delete or recreate the Glacier Vault via Terraform, for example, if the Glacier Vault Lock policy permits that action. This should only be used in conjunction with complete_lock being set to true"
  default     = false
}
