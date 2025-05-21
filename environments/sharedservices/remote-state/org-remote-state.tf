#######################################
# 03 - Backend S3 Bucket
#######################################
resource "aws_s3_bucket" "tf_backend" {
  bucket        = "mda-tf-backend-primary"
  force_destroy = false

  tags = merge(var.tags, {
    Name = "mda-tf-backend-primary"
  })
}

#######################################
# 04 - S3 Versioning
#######################################
resource "aws_s3_bucket_versioning" "tf_backend_versioning" {
  bucket = aws_s3_bucket.tf_backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

#######################################
# 05 - S3 Server-Side Encryption (KMS) # Covered by creating the key manually and calling it in data
#######################################

#######################################
# 06 - DynamoDB Lock Table
#######################################
resource "aws_dynamodb_table" "tf_lock" {
  name         = "mda-tf-lock-primary"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = data.aws_kms_key.mda_root_encryption.arn
  }
  tags = merge(var.tags, {
    Name = "mda-tf-lock-primary"
  })
}


