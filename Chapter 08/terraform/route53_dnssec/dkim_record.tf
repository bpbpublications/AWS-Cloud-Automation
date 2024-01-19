resource "aws_route53_record" "awscloudautomation_dkim_1" {
  zone_id = aws_route53_zone.route53-demo-zone.zone_id
  name = "awscloudautomation1._domainkey"
  type = "CNAME"
  ttl = 1200

  records = [
    "domain_key1"
  ]
}

resource "aws_route53_record" "awscloudautomation_dkim_2" {
  zone_id = aws_route53_zone.route53-demo-zone.zone_id
  name = "awscloudautomation2._domainkey"
  type = "CNAME"
  ttl = 1200

  records = [
    "domain_key2"
  ]
}

resource "aws_route53_record" "awscloudautomation_dkim_3" {
  zone_id = aws_route53_zone.route53-demo-zone.zone_id
  name = "awscloudautomation3._domainkey"
  type = "CNAME"
  ttl = 1200

  records = [
    "domain_key3"
  ]
}
