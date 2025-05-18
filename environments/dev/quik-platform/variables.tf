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

variable "name_prefix" {
  type        = string
  description = "Prefix for naming AWS resources"
}

variable "private_subnet_map" {
  type        = map(string)
  description = "Map of AZ to private subnet CIDRs"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
}
