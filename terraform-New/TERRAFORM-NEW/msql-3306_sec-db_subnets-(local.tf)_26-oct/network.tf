module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = [local.az_a, local.az_b]
  private_subnets = var.pvt_cidrs
  public_subnets  = var.pub_cidrs

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}