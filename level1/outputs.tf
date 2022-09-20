output "env_code" {
  value = var.env_code
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public-subnet_id" {
  value = module.vpc.public-subnet_id
}

output "private-subnet_id" {
  value = module.vpc.private-subnet_id
}

##### Production ###########
output "env_code_prod" {
  value = var.env_code
}

output "vpc_id_prod" {
  value = module.vpc_prod.vpc_id
}

output "public-subnet_id_prod" {
  value = module.vpc_prod.public-subnet_id
}

output "private-subnet_id_prod" {
  value = module.vpc_prod.private-subnet_id
}
