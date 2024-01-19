resource "tls_private_key" "ec2_keys" {
  for_each  = var.server_name
  algorithm = "RSA"
}
resource "aws_key_pair" "ec2_key_pairs" {
  for_each   = var.server_name
  key_name   = "${each.value["server_name"]}-${each.value["key_name"]}"
  public_key = tls_private_key.ec2_keys[each.key].public_key_openssh
  tags = {
    Name     = "${each.value["server_name"]}-${each.value["key_name"]}"
    Service = "KeyPair"
    CreatedBy = "James Odeyinka",
    DateCreated = "03-07-2023",
    Env = "Demo"
  }
}
