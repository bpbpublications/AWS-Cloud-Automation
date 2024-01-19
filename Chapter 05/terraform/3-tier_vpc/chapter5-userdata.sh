#!/bin/bashyum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World. My name is Ibunkun and this is my first Web Server from $(hostname -f)" > /var/www/html/index.html
