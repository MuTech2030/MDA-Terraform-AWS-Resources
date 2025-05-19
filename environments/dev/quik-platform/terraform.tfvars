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
# 05 - VPC - Subments
#######################################
vpc_cidr    = "10.0.0.0/16"
name_prefix = "vpc"
private_subnet_map = {
  "us-east-1a" = "10.0.1.0/24"
  "us-east-1b" = "10.0.2.0/24"
  "us-east-1c" = "10.0.3.0/24"
}

#######################################
# 02 -  S3
#######################################
bucket_name_quick_platform_s3 = "s3"
sse_algorithm                 = "aws:kms"
versioning                    = false
mfa_delete                    = false
apply_lifecycle_rules         = false
enable_logging                = false
# log_bucket_name       = "my-log-bucket"