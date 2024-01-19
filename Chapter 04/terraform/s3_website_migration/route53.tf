resource "aws_route53_zone" "awscloudautomationbook_com" {
  name = "awscloudautomationbook.com"
}

resource "aws_route53_record" "awscloudautomationbook_com-a" {
  zone_id = aws_route53_zone.awscloudautomationbook_com.zone_id
  name    = "awscloudautomationbook.com"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.root_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.root_s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_awscloudautomationbook_com-a" {
  zone_id = aws_route53_zone.awscloudautomationbook_com.zone_id
  name    = "www.awscloudautomationbook.com"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.www_s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.www_s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
