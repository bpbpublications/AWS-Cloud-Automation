resource "aws_route53_record" "demo-server-arecord" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = "demo-server.awscloudautomation.local"
type = "A"
ttl = "300"
records = ["3.134.25.187"]

}
