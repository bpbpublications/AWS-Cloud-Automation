# Defining CIDR Block for VPC
variable "chapter5-demo-vpc_cidr" {
  default = "10.10.0.0/21"
}
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
# Defining CIDR Block for 1st Subnet
variable "pub-subnet1a_cidr" {
  default = "10.10.1.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "pub-subnet1b_cidr" {
  default = "10.10.2.0/24"
}  
# Defining CIDR Block for 1st Subnet
variable "pri-subnet1a_cidr" {
  default = "10.10.3.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "pri-subnet1b_cidr" {
  default = "10.10.4.0/24"
}
# Defining Key Name Variable
#variable "key_name" {
#  default = "key.tf"
#}
# Defining Key Name Variable
#variable "public_key" {
#  default = "jamesdemo-public-key"
#}
