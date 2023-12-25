terraform {
  backend "s3" {
    bucket         = "ritika-terraform"
    key            = "level2-dev/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "ritika-dynamo-terraform"
  }
}
