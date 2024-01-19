resource "aws_backup_plan" "aws_backup_plan" {
  name = "backup_plan"

  rule {
    rule_name         = "backup_rule"
    target_vault_name = aws_backup_vault.aws_backup_vault.name
    schedule          = "cron(0 5 ? * * *)"
    start_window      = 480
    completion_window = 10080
    copy_action {
      destination_vault_arn = local.destination_vault
    }

    lifecycle {
      delete_after = 90
    }
  }
}
