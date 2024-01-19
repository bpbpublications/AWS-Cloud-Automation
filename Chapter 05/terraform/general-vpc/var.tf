# Defining CIDR Block for VPC
variable "general-vpc_cidr" {
  default = "10.10.0.0/20"
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
# Defining CIDR Block for 1st Subnet
variable "pri-subnet2a_cidr" {
  default = "10.10.5.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "pri-subnet2b_cidr" {
  default = "10.10.6.0/24"
}
