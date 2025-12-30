resource "aws_s3_bucket" "my_bucket" {
  bucket =  var.bucket_name

  tags = {
    Name        = "${var.env_prefix}-bucket-123"
    Environment = var.env_prefix
  }
}
resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }

}
