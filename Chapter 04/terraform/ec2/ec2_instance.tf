resource "aws_instance" "ec2-web" {
ami           = "ami-00eeedc4036573771" # us-east-2
instance_type = "t2.micro"
availability_zone = "us-east-1"
key_name = "tf-key-pair"
network_interface {
device_index         = 0
network_interface_id = aws_network_interface.ec2-web.id
}
user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo bash -c 'echo your very first web server > /var/www/html/index.html'
EOF
tags = {
Name = "first-ec2-server"
}
}
output "server_private_ip" {
value = aws_instance.ec2-web.private_ip
}
output "server_public_ipv4" {
value = aws_instance.ec2-web.public_ip
}
output "server_id" {
value = aws_instance.ec2-web.id
}
