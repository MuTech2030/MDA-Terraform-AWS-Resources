primary_region   = "us-east-1"
secondary_region = "us-west-2"

tags = {
  Environment  = "prod"
  Project      = "aws-tower-root-account"
  BusinessUnit = "Platform-Team"
  Owner        = "DevOps-Team"
  Terraform    = "1"
}

#######################################
# 02 -  S3
#######################################
bucket_name_mda_s3    = "s3"
sse_algorithm         = "aws:kms"
versioning            = false
mfa_delete            = false
apply_lifecycle_rules = false
enable_logging        = false
# log_bucket_name       = "my-log-bucket"
#######################################