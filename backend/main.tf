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

module "s3bucket" {
  source         = "../modules/s3bucket"
}

module "dynamodb" {
  source         = "../modules/dynamodb"
}
