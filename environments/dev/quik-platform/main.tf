#######################################
# 01 - Module Call for VPC
#######################################
module "vpc" {
  source = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/03-vpc"
  vpc_cidr           = var.vpc_cidr
  name_prefix        = var.name_prefix
  private_subnet_map = var.private_subnet_map
  tags               = var.tags
}

#######################################
# 01 - Module Call for S3
#######################################
module "quick-platform-s3" {
  source                = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/07-s3"

  bucket_name           = local.actual_quick_platform_s3
  tags                  = var.tags
  sse_algorithm         = var.sse_algorithm
  kms_key_id            = data.aws_kms_key.mda_root_encryption.arn
  bucket_policy         = var.bucket_policy
  versioning            = var.versioning
  mfa_delete            = var.mfa_delete
  apply_lifecycle_rules = var.apply_lifecycle_rules
  enable_logging        = var.enable_logging
  log_bucket_name       = var.log_bucket_name
}

