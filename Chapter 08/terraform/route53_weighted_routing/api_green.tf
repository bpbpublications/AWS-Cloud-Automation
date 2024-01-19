resource "aws_route53_record" "demo-server-wwwrecord" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = "demo-server.awscloudautomation.xyz"
type = "A"
ttl = "300"
records = ["3.145.167.229"]

weighted_routing_policy {
    weight = 90 // this weight / sum of the weights for all records
  }

  set_identifier = "api-green"

}
