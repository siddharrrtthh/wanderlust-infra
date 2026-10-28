resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "wonderlust-terraform-lock"
  billing_mode   = "Pay-per-request"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

    tags = {
    Name        = "Wonderlust"
    Environment = "Production"
  }
}
