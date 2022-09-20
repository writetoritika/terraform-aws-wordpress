module "vpc_prod" {
  source         = "../modules/vpc"
  env_code       = var.env_code_prod
  vpc            = var.vpc
  public-subnet  = var.public-subnet
  private-subnet = var.private-subnet
}
