resource "aws_route53_record" "demo-server-wwwrecord" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = "www.awscloudautomation.local"
type = "A"
ttl = "300"
records = ["3.134.25.187"]

}
