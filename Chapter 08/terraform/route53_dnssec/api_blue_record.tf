resource "aws_route53_record" "demo-api-blue" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = "demo-server.awscloudautomation.xyz"
type = "CNAME"
ttl = "300"
records = ["3.137.177.213"]

weighted_routing_policy {
    weight = 10 // this weight / sum of the weights for all records
  }

  set_identifier = "api-blue"

}
