# Creating efs
resource "aws_efs_file_system" "efs-demo"{
  creation_token = "efs_file_token"

  tags = {
    Name = "efs_demo_file_system"
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}

resource "aws_efs_mount_target" "efs_mount" {
  file_system_id  = aws_efs_file_system.efs-demo.id
  subnet_id       = "${aws_subnet.efs-demo-subnet.id}"
  security_groups = ["${aws_security_group.efs-demo-sgroup.id}"]
}

output "myip" {
  value = aws_instance.efsdemo-instance1.public_ip
}

resource "null_resource" "nullip" {
  depends_on = [
    aws_efs_mount_target.efs_mount,
  ]



  connection {
    agent    = "false"
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${tls_private_key.efs-tfdemo-keypair.private_key_pem}"
    host     = "${aws_instance.efsdemo-instance1.public_ip}"
  }

provisioner "remote-exec"{
   
       inline = [
         
          "sudo apt install httpd php git -y",
          "sudo systemctl start httpd",
          "sudo systemctl enable httpd",
          "sudo mkfs.ext4  /dev/xvdf",
          "sudo rm -rf /var/www/html/*",
          "sudo mount  /dev/xvdf  /var/www/html",
          "sudo git clone https://github.com/awscloudautomationbook/chapter4-efs-filetrans.git /var/www/html"
         ]

    }
}
