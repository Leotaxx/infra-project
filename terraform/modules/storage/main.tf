# modules/storage/main.tf - Define S3 Buckets
resource "aws_s3_bucket" "primary" {
  bucket = "retail-primary-bucket"
}
