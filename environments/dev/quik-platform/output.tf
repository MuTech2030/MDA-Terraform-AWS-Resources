output "account_id" {
  description = "AWS account ID of the caller"
  value       = data.aws_caller_identity.current.account_id
}

output "primary_region" {
  description = "Primary AWS region"
  value       = var.primary_region
}
