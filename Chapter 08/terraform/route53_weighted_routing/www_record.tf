resource "aws_route53_record" "demo-server-wwwrecord" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = "demo-server.awscloudautomation.xyz"
type = "A"
ttl = "300"
records = ["3.145.167.229","3.137.177.213"]

}
