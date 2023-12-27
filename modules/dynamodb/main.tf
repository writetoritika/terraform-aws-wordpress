resource "aws_dynamodb_table" "terraform_remote_state" {
  name           = "ritika-dynamo-terraform"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
