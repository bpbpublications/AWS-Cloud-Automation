resource "aws_directory_service_directory" "fsx-demo-winad" {
  name     = "${var.ad_name[var.environment]}"
  password = jsondecode(data.aws_secretsmanager_secret_version.ad_password.secret_string)["AD_PASSWORD"]
  edition  = "Standard"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = "${aws_vpc.test_vpc.id}"
    subnet_ids = ["${aws_subnet.public[0].id}",             "${aws_subnet.public[1].id}"]
  }

  tags = {
    Project     = "cloudautomationproject"
    Environment = "${var.environment}"
  }
}
