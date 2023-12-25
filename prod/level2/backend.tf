terraform {
  backend "s3" {
    bucket         = "israel-terraform"
    key            = "level2-prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "writetoritika-dynamo-terraform"
  }
}
