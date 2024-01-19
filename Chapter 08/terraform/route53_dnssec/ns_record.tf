resource "aws_route53_record" "demo-name-server" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = "awscloudautomation.com"
type = "NS"
ttl = "300"

records = ["aws_route53_zone.route53-demo-zone.name_server"]

}
