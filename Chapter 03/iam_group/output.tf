# Outputs

output "mfa-only-admin-group" {
  description = "The name of the IAM group for admins"
  value       = "${aws_iam_group.mfa-only-admin-group.id}"
}

output "default-group" {
  description = "The name of the IAM group for evryone"
  value       = "${aws_iam_group.default-user-group.id}"
}
