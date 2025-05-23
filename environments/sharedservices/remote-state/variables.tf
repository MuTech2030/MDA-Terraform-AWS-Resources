variable "primary_region" {
  description = "Primary AWS region for the infrastructure"
  type        = string
}

variable "secondary_region" {
  description = "Secondary AWS region for high availability / DR"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "bucket_name_mda_s3" {
  description = "Base name of the quick platform S3 bucket (prefix and region are added dynamically)"
  type        = string
}


variable "sse_algorithm" {
  type        = string
  description = "Server-side encryption algorithm (e.g., AES256 or aws:kms)"
  default     = "AES256"
}

variable "kms_key_id" {
  type        = string
  description = "The KMS key ID to use for server-side encryption (required if using aws:kms)"
  default     = ""
}

variable "bucket_policy" {
  type        = string
  description = "Custom bucket policy JSON. If empty, default policy is applied."
  default     = ""
}

variable "versioning" {
  type        = bool
  description = "Enable versioning for the S3 bucket"
  default     = true
}

variable "mfa_delete" {
  type        = bool
  description = "Enable MFA delete for versioning"
  default     = false
}

variable "apply_lifecycle_rules" {
  type        = bool
  description = "Enable lifecycle rules for bucket objects"
  default     = true
}

variable "enable_logging" {
  type        = bool
  description = "Enable server access logging for the S3 bucket"
  default     = false
}

variable "log_bucket_name" {
  type        = string
  description = "Target bucket name to store access logs"
  default     = ""
}
