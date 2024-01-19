resource "aws_security_group" "efs-demo-sgroup" {
   name = "efs demo security gp"
   vpc_id = "${aws_vpc.efs-demo-vpc.id}"
  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["207.172.40.22/32"]
  }
  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

 // NFS

 ingress {
    protocol  = "tcp"
    from_port = 2049
    to_port   = 2049
    cidr_blocks = ["207.172.40.22/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
tags = {
    name = "efs-demo-sgroup",
    CreatedBy = "James Odeyinka",
    DateCreated = "02-25-2023",
    Env = "Demo"
  }
}
