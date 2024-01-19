output "public_ip" {
  value = aws_instance.ec2_public.public_ip
}

output "public_ip2" {
  value = aws_instance.ec2_public2.public_ip
}

#output "private_ip" {
#  value = aws_instance.ec2_private.private_ip
#}
