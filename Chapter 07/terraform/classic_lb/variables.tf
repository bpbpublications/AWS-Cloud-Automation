# Defining Public Key
variable "public_key" {
  default = "autoscaling-demo.pub"
}
# Defining Private Key
variable "private_key" {
  default = "autoscaling-demo.pem"
}
# Definign Key Name for connection
variable "key_name" {
  default = "autoscaling-demo"
  description = "Name of AWS key pair"
}
# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.10.0.0/20"
}
# Defining CIDR Block for Subnet
variable "subnet_cidr" {
  default = "10.10.1.0/24"
}
# Defining CIDR Block for 2d Subnet
variable "subnet1_cidr" {
  default = "10.10.2.0/24"
}
