output "ns-servers" {
value = "${aws_route53_zone.route53-demo-zone.name_servers}"
}
