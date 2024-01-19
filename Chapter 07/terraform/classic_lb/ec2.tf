resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
image_id = "ami-02238ac43d6385ab3" 
  instance_type = "t2.micro"
  key_name = "jodeyinka_cyber_macaws_sshkey"
security_groups = [ "${aws_security_group.autoscaling-demo-ec2-sg1.id}" ]
  associate_public_ip_address = true
  user_data = "${file("data.sh")}"
lifecycle {
    create_before_destroy = true
  }
}
