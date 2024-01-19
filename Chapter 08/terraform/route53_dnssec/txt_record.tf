resource "aws_route53_record" "demo-txt-record" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = ""
type = "TXT"
ttl = "300"

records = [
"demodomain-verification=123987",
"v=spf1 include:_spf.demo mx ~all"
]

}
