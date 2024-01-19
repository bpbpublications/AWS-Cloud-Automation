output "public_ip" {
  value = aws_instance.ec2_public[0].public_ip
}
output "public_ip1" {
  value = aws_instance.ec2_public[1].public_ip
}
output "public_ip2" {
  value = aws_instance.ec2_public[2].public_ip
}

output "private_ip" {
  value = aws_instance.ec2_private[0].private_ip
}
output "private_ip1" {
  value = aws_instance.ec2_private[1].private_ip
}
