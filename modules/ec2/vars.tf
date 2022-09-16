variable "env_code" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public-subnet_id" {}

variable "private-subnet_id" {}

variable "target_group_arn" {}

variable "rds_password" {}

variable "db_username" {}

variable "db_name" {}

variable "rds_endpoint" {}