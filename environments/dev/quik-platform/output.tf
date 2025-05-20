output "account_id" {
  description = "AWS account ID of the caller"
  value       = data.aws_caller_identity.current.account_id
}

output "primary_region" {
  description = "Primary AWS region"
  value       = var.primary_region
}

#######################################
# 03 - VPC - Subnets
#######################################
output "named_private_subnet_ids" {
  value = module.vpc.private_subnet_ids_with_names
}

#######################################
# 03 - S3
#######################################

output "bucket_id" {
  description = "The name (ID) of the S3 bucket"
  value       = module.quick-platform-s3.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.quick-platform-s3.bucket_arn
}

#######################################
# 03 - Postgress RDS
#######################################
output "db_endpoint" {
  value = module.postgres.endpoint
}

output "db_arn" {
  value = module.postgres.arn
}

#######################################
# 03 - SG
#######################################
output "security_group_id" {
  description = "The ID of the created security group"
  value       = module.my_security_group.security_group_id
}
