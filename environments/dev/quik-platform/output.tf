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
output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = module.vpc.private_subnet_ids
}
