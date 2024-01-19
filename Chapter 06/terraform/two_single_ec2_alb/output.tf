output "public_connection_string" {
  description = "Copy/Paste/Enter - You are in the Public Server"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ec2-user@${module.ec2.public_ip}"
}

output "public_connection_string2" {
  description = "Copy/Paste/Enter - You are in the Public Server 2"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ec2-user@${module.ec2.public_ip2}"
}

output "alb" {
  description = "Copy/Paste/Enter - You are in the Public Server 2"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ec2-user@${module.ec2.public_ip2}"
}

#output "private_connection_string" {
#  description = "Copy/Paste/Enter - You are in the Private Server"
#  value       = "ssh -i ${module.ssh-key.key_name}.pem ec2-user@${module.ec2.private_ip}"
#}
