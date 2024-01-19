# Scan EC2 with the Tag Scan
resource "aws_inspector_resource_group" "bar" {
  tags {
    Name = "${aws_instance.inspector-instance.tags.Scan}"
  }
}

resource "aws_inspector_assessment_target" "myinspect" {
  name = "inspector-instance-assessment"
  resource_group_arn = "${aws_inspector_resource_group.bar.arn}"
}

resource "aws_inspector_assessment_template" "foo" {
  name       = "bar template"
  target_arn = "${aws_inspector_assessment_target.myinspect.arn}"
  duration   = 3600

  rules_package_arns = [
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-gEjTy7T7",
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-rExsr2X8",
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-PmNV0Tcd",
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-gBONHN9h",
	"arn:aws:inspector:us-east-1:316112463485:rulespackage/0-JnA8Zp85",
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-m8r61nnh",
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-cE4kTR30",
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-AxKmMHPX",
  ]
}