variable "env" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_ipv4_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "enable_nat_gw" {
  type = bool
}

variable "enable_vpn_gw" {
  type = bool
}