terraform {
  backend "s3" {
    bucket         = "israel-terraform"
    key            = "level2-dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "israel-dynamo-terraform"
  }
}
