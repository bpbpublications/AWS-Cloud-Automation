resource "aws_route53_record" "mail-arecord" {
zone_id = "${aws_route53_zone.route53-demo-zone.zone_id}"
name = "awscloudautomation.local"
type = "MX"
ttl = "300"
records = [

"1 aspmx.l.google.com.",
"5 alt1.aspmx.l.google.com.",
"5 alt2.aspmx.l.google.com.",
"10 aspmx2.googlemail.com.",
"10 aspmx3.googlemail.com."

]

}
