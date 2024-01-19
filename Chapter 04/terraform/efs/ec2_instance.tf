resource "aws_instance" "efsdemo-instance1" {
  
  ami           = "ami-00eeedc4036573771"
  instance_type = "t2.micro"
  availability_zone = "us-east-2b"
  key_name      = "efs-tfdemo-key"
  security_groups = [ "${aws_security_group.efs-demo-sgroup.id}" ]
  subnet_id = "${aws_subnet.ec2-demo-subnet.id}"
  
   connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key =  tls_private_key.efs-tfdemo-keypair.private_key_pem
    host     = "${aws_instance.efsdemo-instance1.public_ip}"
 }


 provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && apt-get upgrade",
      "sudo apt install httpd  php git -y",
      "sudo systemctl restart httpd",
      "sudo systemctl enable httpd"
    ]
  }


tags = {
       Name = "efs-demo-svr1"
       CreatedBy = "James Odeyinka",
       DateCreated = "02-25-2023",
       Env = "PoC"
  }
 }

resource "aws_instance" "efsdemo-instance2" {

  ami           = "ami-00eeedc4036573771"
  instance_type = "t2.micro"
  availability_zone = "us-east-2b"
  key_name      = "efs-tfdemo-key"
  security_groups = [ "${aws_security_group.efs-demo-sgroup.id}" ]
  subnet_id = "${aws_subnet.ec2-demo-subnet.id}"

   connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key =  tls_private_key.efs-tfdemo-keypair.private_key_pem
    host     = "${aws_instance.efsdemo-instance2.public_ip}"
 }


 provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && apt-get upgrade",
      "sudo apt install httpd  php git -y",
      "sudo systemctl restart httpd",
      "sudo systemctl enable httpd"
    ]
  }


tags = {
       Name = "efs-demo-svr2"
       CreatedBy = "James Odeyinka",
       DateCreated = "02-25-2023",
       Env = "Demo"
  }
 }
