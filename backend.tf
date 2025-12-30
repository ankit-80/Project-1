  terraform {
  backend "s3" {
    bucket = "airbnb-proj-dev-bucket-123"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "airbnb_proj-dev-terraform-lock-db-table" # used created db table
  }
}
