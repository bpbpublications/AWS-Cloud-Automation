resource "aws_route53_record" "demo-primary-record" {
    zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
    name    = "${aws_route53_zone.route53-demo-zone.name}"
    type    = "A"
    ttl     = "60"
    records = ["${var.primary_awscloudautomation_com}"]
  
    failover_routing_policy {
        type = "PRIMARY"
    }
  
    set_identifier  = "demo-primary-record"
    health_check_id = "${aws_route53_health_check.demo-primary-record.id}"
}
  
resource "aws_route53_health_check" "demo-primary-record" {
    ip_address        = "${var.primary_awscloudautomation_com}"
    port              = "80"
    type              = "HTTP"
    resource_path     = "/"
    failure_threshold = "3"
    request_interval  = "30"
}
