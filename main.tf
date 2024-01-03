terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

module "ec2" {
  source   = "../../modules/ec2"
  env_code = var.env_code

  vpc_id            = data.terraform_remote_state.networking.outputs.vpc_id
  public-subnet_id  = data.terraform_remote_state.networking.outputs.public-subnet_id
  private-subnet_id = data.terraform_remote_state.networking.outputs.private-subnet_id
  target_group_arn  = module.loadbalancer.target_group_arn
  rds_endpoint      = module.rds.rds_endpoint
  db_username       = var.db_username
  db_name           = var.db_name
  rds_password      = local.rds_password
}

module "loadbalancer" {
  source            = "../../modules/loadbalancer"
  env_code          = var.env_code
  vpc_id            = module.ec2.vpc_id
  public-subnet_id  = module.ec2.public-subnet_id
  private-subnet_id = module.ec2.private-subnet_id
}

module "rds" {
  source            = "../../modules/rds"
  env_code          = var.env_code
  vpc_id            = module.ec2.vpc_id
  private-subnet_id = module.ec2.private-subnet_id
  rds_password      = local.rds_password
  lb_security_group = module.loadbalancer.lb_security_group
  multi_az          = true
  db_username       = var.db_username
  db_name           = var.db_name
}
