module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_ipv4_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gw
  enable_vpn_gateway = var.enable_vpn_gw

  tags = {
    terraform = "true"
    owner = "SRE"
    contact = "evrhiness@gmail.com"
    environment = var.env
  }
}