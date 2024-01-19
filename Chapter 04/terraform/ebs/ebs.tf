resource "aws_ebs_volume" "ebsvolume" {
  availability_zone = "us-east-2a"
  size = 20
  encrypted = false
  tags = {
    name = "ebs-demo",
	CreatedBy = "James Odeyinka",
	DateCreated = "02-25-2023",
	Env = "PoC"
  }

}

resource "aws_volume_attachment" "mount-ebs-volume" {
  device_name = "/dev/sdd"
  instance_id = "i-09c247278998c2f83"
  volume_id = "${aws_ebs_volume.ebsvolume.id}"
}
