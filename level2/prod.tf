module "ec2_prod" {
  source   = "../modules/ec2"
  env_code = var.env_code_prod

  vpc_id            = data.terraform_remote_state.networking.outputs.vpc_id_prod
  public-subnet_id  = data.terraform_remote_state.networking.outputs.public-subnet_id_prod
  private-subnet_id = data.terraform_remote_state.networking.outputs.private-subnet_id_prod
  target_group_arn  = module.loadbalancer_prod.target_group_arn
  rds_endpoint      = module.rds_prod.rds_endpoint
  db_username       = var.db_username
  db_name           = var.db_name
  rds_password      = local.rds_password
}

module "loadbalancer_prod" {
  source            = "../modules/loadbalancer"
  env_code          = var.env_code_prod
  vpc_id            = module.ec2_prod.vpc_id
  public-subnet_id  = module.ec2_prod.public-subnet_id
  private-subnet_id = module.ec2_prod.private-subnet_id
}

module "rds_prod" {
  source            = "../modules/rds"
  env_code          = var.env_code_prod
  vpc_id            = module.ec2_prod.vpc_id
  private-subnet_id = module.ec2_prod.private-subnet_id
  rds_password      = local.rds_password
  lb_security_group = module.loadbalancer_prod.lb_security_group
  multi_az          = true
  db_username       = var.db_username
  db_name           = var.db_name
}
