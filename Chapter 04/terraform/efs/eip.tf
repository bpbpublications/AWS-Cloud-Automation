# Creating EIP
resource "aws_eip" "ec2-demo-eip" {
  instance = aws_instance.efsdemo-instance1.id
  vpc      = true
}

#Associate EIP with EC2 Instance
resource "aws_eip_association" "associate-ec2-demo-eip" {
  instance_id   = aws_instance.efsdemo-instance1.id
  allocation_id = aws_eip.ec2-demo-eip.id
}
