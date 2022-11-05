module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.10.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
  public_subnets  = ["10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}