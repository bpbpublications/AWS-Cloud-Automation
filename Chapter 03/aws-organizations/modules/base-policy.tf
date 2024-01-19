/*
Accounts are created with a default Organization Account Access Role with 
admin rights to allow the management account to access the newly created member. 
*/
resource "aws_organizations_account" "this" {
  name      = var.name
  email     = var.email
  parent_id = var.parent_id
}

resource "aws_iam_account_password_policy" "this" {
  max_password_age               = var.max_password_age
  minimum_password_length        = var.minimum_password_length
  allow_users_to_change_password = var.allow_users_to_change_password
  hard_expiry                    = var.hard_expiry
  password_reuse_prevention      = var.password_reuse_prevention
  require_lowercase_characters   = var.require_lowercase_characters
  require_uppercase_characters   = var.require_uppercase_characters
  require_numbers                = var.require_numbers
  require_symbols                = var.require_symbols
}
