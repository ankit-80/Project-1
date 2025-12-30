resource "aws_dynamodb_table" "terraform_lock_db" {
  name         = "terraform-lock-db-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.env_prefix}-terraform-lock-db-table"
  }
}
