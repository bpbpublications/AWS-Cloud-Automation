resource "aws_acm_certificate" "ssl_certificate" {
  domain_name               = "awscloudautomationbook.com"
  subject_alternative_names = ["*.awscloudautomationbook.com"]

# Validation Method can be Email or TXT

  validation_method         = "EMAIL" 
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.ssl_certificate.arn
}
