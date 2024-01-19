resource "aws_route53_zone" "route53-demo-zone" {
    name = "awscloudautomation.local"

tags = {
    name = "Demo zone"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-16-2023",
    Env = "Demo"
  }

}
