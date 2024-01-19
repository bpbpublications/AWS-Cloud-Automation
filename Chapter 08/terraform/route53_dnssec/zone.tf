resource "aws_route53_zone" "route53-demo-zone" {
name = "awscloudautomation.local"
}

#resource "aws_route53_key_signing_key" "dnssecksk" {
#  name = "awscloudautomation.local"
#  hosted_zone_id = data.aws_route53_zone.route53-demo-zone.id
#  key_management_service_arn = aws_kms_key.dnssecksk.arn
#}

#resource "aws_route53_hosted_zone_dnssec" "route53-demo-zone" {
#  depends_on = [
#    aws_route53_key_signing_key.dnssecksk
#  ]
#  hosted_zone_id = aws_route53_key_signing_key.dnssecksk.hosted_zone_id
#}


