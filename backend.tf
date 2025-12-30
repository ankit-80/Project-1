  terraform {
  backend "s3" {
    bucket = "airbnb-proj-dev-bucket-123"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-db-table" # first create db table then attach here
  }
}
