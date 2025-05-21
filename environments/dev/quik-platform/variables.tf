variable "primary_region" {
  description = "Primary AWS region for the infrastructure"
  type        = string
}

variable "secondary_region" {
  description = "Secondary AWS region for high availability / DR"
  type        = string
}

#######################################
# 02 - VPC - Subnets
#######################################
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "private_subnets" {
  type = map(object({
    cidr_block = string
    name       = string
    az         = optional(string)
  }))
  description = "Map of subnet name to CIDR, name, and optional AZ"
}


#######################################
# 02 -  S3
#######################################

variable "bucket_name_quick_platform_s3" {
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

#######################################
# 04 - Postgress RDS
#######################################
variable "allocated_storage" {
  type = number
}
variable "aws_db_subnet_group_name" {
  type = string
}

variable "engine_version" {
  type = string
}
variable "engine" {
  type = string
}
variable "instance_class" {
  type = string
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type    = string
  default = ""
}

variable "skip_final_snapshot" {
  type = bool
}

variable "publicly_accessible" {
  type = bool
}



variable "vpc_security_group_ids" {
  type = list(string)
}


variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}



#######################################
# 04 - AWS SG
#######################################

variable "ingress_rules" {
  description = "Ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
}

variable "egress_rules" {
  description = "Egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
}


## EKS
variable "eks_iam_role_name" {
  type        = string
  description = "the name of the eks_iam_role"
}
variable "eks_control_plane_name" {
  type        = string
  description = "the name of the eks control plane"
}