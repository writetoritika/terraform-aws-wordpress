terraform {
  backend "s3" {
    bucket         = "ritika-terraform"
    key            = "level1-prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "writetoritika-dynamo-terraform"
  }
}
