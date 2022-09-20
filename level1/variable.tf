variable "env_code" {
  default = "wordpress"
}

variable "env_code_prod" {
  default = "wordpress-prod"
}

variable "vpc" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public-subnet" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private-subnet" {
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_prod" {
  type    = string
  default = "10.0.1.0/16"
}
