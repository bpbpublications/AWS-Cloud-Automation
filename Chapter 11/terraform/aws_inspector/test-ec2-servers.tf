# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "chapter11-inspector" {
  ami                         = "ami-00399ec92321828f5"
  instance_type               = "t2.micro"
  count                       = 3
# key_name                    = aws_key_pair.jamesdemo-public-key.key_name
  key_name                    = "jodeyinka_cyber_macaws_sshkey" # This is to reference the key that already existed in AWS
#  key_name                    = "tfdemo-key-pair"
  vpc_security_group_ids      = ["${aws_security_group.chapter11-inspector-public-sg.id}"]
  subnet_id                   = "${aws_subnet.three-tier-public-subnet-1a.id}"
  associate_public_ip_address = true
  user_data                  = "${file("inspector-script.sh")}"
# user_data_base64           = "IyEvYmluL2Jhc2gNCg0KY2QgL29wdCAgICAjIGNoYW5nZSBkaXJlY3RvcnkgdG8gL29wdA0Kd2dldCBodHRwczovL2dpdGh1Yi5jb20vZ29waGlzaC9nb3BoaXNoL3JlbGVhc2VzL2Rvd25sb2FkL3YwLjExLjAvZ29waGlzaC12MC4xMS4wLWxpbnV4LTY0Yml0LnppcCAgICAjIGRvd25sb2FkIHRoZSBnb3BoaXNoIHppcA0KdW56aXAgZ29waGlzaC12MC4xMS4wLWxpbnV4LTY0Yml0LnppcCAgICAgICAjIHVuemlwIHRoZSBnb3BoaXNoIHppcCBmaWxlDQpzZWQgLWkgJ3MvMTI3XC4wXC4wXC4xLzBcLjBcLjBcLjAvZycgY29uZmlnLmpzb24gICAjIHJlcGxhdGUgMTI3LjAuMC4xIHdpdGggMC4wLjAuMA0KY2htb2QgK3ggLi9nb3BoaXNoICAgIyBzZXQgZXhlY3V0YWJsZSBiaXQgb24gZ29waGlzaCBwcm9ncmFtDQouL2dvcGhpc2ggICAgICAgICAgICAjIGZpbmFsbHkganVzdCBydW4gdGhlIHByb2dyYW0="

  tags = {
    Name = "Chapter5 Demo Cyber Gophish"
    CreatedBy = "James Odeyinka",
    DateCreated = "04-25-2023",
	Scan = "InspectInstances"
    Env = "Demo"
  }
}
