#######################################
# 01 - Provider Configuration
#######################################
/*
provider "aws" {
  region = "us-east-1"
}

#######################################
# 02 - Locals: Region, Tags, Prefix
#######################################
locals {
  prefix = "mda"

  tags = {
    Environment   = "prod"
    Project       = "aws-tower-root-account"
    BusinessUnit  = "Platform-Team"
    Owner         = "DevOps-Team"
    Terraform     = "1"
  }
}
*/
#######################################
# 03 - Backend S3 Bucket
#######################################
resource "aws_s3_bucket" "tf_backend" {
  bucket         = "${local.prefix}-tf-backend-primary"
  force_destroy  = false

  tags = merge(local.tags, {
    Name = "${local.prefix}-tf-backend-primary"
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
# 05 - S3 Server-Side Encryption (KMS)
#######################################
resource "aws_s3_bucket_server_side_encryption_configuration" "tf_backend_sse" {
  bucket = aws_s3_bucket.tf_backend.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = data.aws_kms_key.mda_root_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

#######################################
# 06 - DynamoDB Lock Table
#######################################
resource "aws_dynamodb_table" "tf_lock" {
  name         = "${local.prefix}-tf-lock-primary"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = merge(local.tags, {
    Name = "${local.prefix}-tf-lock-primary"
  })
}


