provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "backend-s3" {
  bucket = "hjhjhjhj" 
  force_destroy = "true"
  
}
resource "aws_s3_bucket_versioning" "backend-s3-version" {
  bucket = aws_s3_bucket.backend-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "backend-dynamoDB" {
    name           = "backend"
    billing_mode   = "PROVISIONED"
    read_capacity  = 10
    write_capacity = 10
    hash_key       = "LockID"

    attribute {
     name = "LockID"
     type = "S"
   }
   }
