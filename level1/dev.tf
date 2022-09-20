module "vpc" {
  source         = "../modules/vpc"
  env_code       = var.env_code
  vpc            = var.vpc
  public-subnet  = var.public-subnet
  private-subnet = var.private-subnet
}
