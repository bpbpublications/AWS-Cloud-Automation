resource "aws_route53_record" "demo-secondary-record" {
    zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
    name    = "${aws_route53_zone.route53-demo-zone.name}"
    type    = "A"
    ttl     = "60"
    records = ["${var.secondary_awscloudautomation_com}"]
  
    failover_routing_policy {
        type = "SECONDARY"
    }
  
    set_identifier  = "demo-secondary-record"
    health_check_id = "${aws_route53_health_check.demo-secondary-record.id}"
}
  
resource "aws_route53_health_check" "demo-secondary-record" {
    ip_address        = "${var.secondary_awscloudautomation_com}"
    port              = "80"
    type              = "HTTP"
    resource_path     = "/"
    failure_threshold = "3"
    request_interval  = "30"
}
