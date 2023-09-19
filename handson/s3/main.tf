provider "aws" {}
# S3バケットの作成
resource "aws_s3_bucket" "example_bucket" {
  bucket = "boundary-sessions-${random_pet.bucket_name.id}"
  tags = {
    Name = "boundary-sessions-${random_pet.bucket_name.id}"
  }
}

# ランダムな名前の生成
resource "random_pet" "bucket_name" {
  keepers = {
    timestamp = timestamp()
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}

output "bucket_region" {
  value = aws_s3_bucket.example_bucket.region
}

