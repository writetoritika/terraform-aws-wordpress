terraform {
  backend "s3" {
    bucket         = "israel-terraform"
    key            = "level1-dev/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "ritika-dynamo-terraform"
  }
}
