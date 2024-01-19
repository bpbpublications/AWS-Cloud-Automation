## AWS Secret Manager
resource "aws_secretsmanager_secret" "secrets_manager" {
  for_each = var.server_name
  name     = "${each.value["server_name"]}/${each.value["key_name"]}"
  description = "Contains the PEM key for ${each.value["server_name"]}"
  recovery_window_in_days = 0
  tags = {
    name = "Demo Secret Manager"
    Service = "SecretKey"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}
resource "aws_secretsmanager_secret_version" "secrets_manager_version" {
  for_each      = aws_secretsmanager_secret.secrets_manager
  secret_id     = aws_secretsmanager_secret.secrets_manager[each.key].id
  secret_string = tls_private_key.ec2_keys[each.key].private_key_pem
}
