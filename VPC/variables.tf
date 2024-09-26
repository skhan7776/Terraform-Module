
// VPC Creation
variable "myvpc" {
  type = string
  default = "10.0.0.0/16"
}

//Private Subnet
variable "private_subnet" {
  type = string
  default = "10.0.1.0/24"  
}

//Public Subnet
variable "public_subnet" {
  type = string
  default = "10.0.2.0/24"  
}

//public routing table
variable "public_route" {
  default = "0.0.0.0/0" 
}

//ipv6 routing table
variable "private_route" {
  default = "10.0.0.0/0"
}